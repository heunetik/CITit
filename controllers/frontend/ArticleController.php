<?php
/**
 * DotBoost Technologies Inc.
 * DotKernel Application Framework
 *
 * @category   DotKernel
 * @package    Frontend
 * @copyright  Copyright (c) 2009-2015 DotBoost Technologies Inc. (http://www.dotboost.com)
 * @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @version    $Id: PageController.php 867 2015-01-03 22:52:05Z julian $
*/

/**
 * Page Controller
 * @author     DotKernel Team <team@dotkernel.com>
 */

$articleView = new Article_View($tpl);
$articleModel = new Article();
$session = Zend_Registry::get('session');
// all actions MUST set  the variable  $pageTitle
$pageTitle = $option->pageTitle->action->{$registry->requestAction};
switch ($registry->requestAction)
{
	default:
	case 'show_articles':

		$views = $articleModel->getViews();
		if(isset($session->user->id) && !empty($session->user->id)) {
			$articleData = $articleModel->getAllArticleData($session->user->id, 0);
			//echo"<pre/>";var_dump($articleData);exit;

		} else {
			$articleData = $articleModel->getAllArticleData('', 0);
		}

		$articleView->showArticles('show_articles', $articleData,$views);
	
		if($_SERVER['REQUEST_METHOD'] == 'POST') {

			if(isset($_POST['action'])) {
				$uidFromSession = $session->user->id;
				if ($uidFromSession != 0) {
					$articleModel->handleLikeDislikeRequests($_POST['action'], 0, $_POST['state'], $uidFromSession, $_POST['id']);
					$newLikeNumber = $articleModel->countLikesDislikes(0,$_POST['id']);
					echo json_encode(['newLikeNumber' => $newLikeNumber]);
					exit;
				}
			}
			if (isset($_POST['loadMore'])) {
				if(isset($session->user->id) && !empty($session->user->id)) {
					$uidFromSession = $session->user->id;
					$articleData = $articleModel->getAllArticleData($uidFromSession, (int)$_POST['loadMore'] * 10);
				} else {
					$uidFromSession = 0;
					$articleData = $articleModel->getAllArticleData('', (int)$_POST['loadMore'] * 10);
				}

				$count = (int)$_POST['loadMore'];

				if ($uidFromSession != 0) {
					$send = [
						'articleData' => $articleData,
						'count' => $count,
						'logged' => 'true'
					];
				} else {
					$send = [
						'articleData' => $articleData,
						'count' => $count,
						'logged' => 'false'
					];
				}
				echo json_encode($send);

				exit;
			}
		}
		break;

	case 'show_article_content':
		$id = $registry->request['id'];
		if(isset($session->user->id))
		{
			$userId = $session->user->id;
			$articleModel->registerView($id);

		}
	
		$articleData = $articleModel->getSingleArticleData($registry->request['id']);
		$articleCommentAndReply = $articleModel->getCommentByArticleId($registry->request['id']);

		if(isset($session->user->id) && !empty($session->user->id)) {
			$likedCommentsOnAccessedArticle = $articleModel->returnCommentsLikedByUserOnArticle($session->user->id,$registry->request['id']);
		} else {
			$likedCommentsOnAccessedArticle = [];
		}
		
		if($articleData != 0) {
			$articleView->showSingleArticle('show_article_content', $articleData, $articleCommentAndReply, $likedCommentsOnAccessedArticle);
		} else {
			header('location: '.$registry->configuration->website->params->url.'/show_articles');
			exit;
		}

		if($_SERVER['REQUEST_METHOD'] == 'POST') {

			$uidFromSession = $session->user->id;
			if (isset($_POST['action']) && $uidFromSession != 0) {
				$articleModel->handleLikeDislikeRequests($_POST['action'], $_POST['id'], $_POST['state'], $uidFromSession, $registry->request['id']);
				$newLikeNumber = $articleModel->countLikesDislikes($_POST['id']);
				echo json_encode(['newLikeNumber' => $newLikeNumber]);
				exit;
			}
			if (isset($_POST['id']) && !empty($_POST['id'])) {
				$postId = (int)$_POST['id'];
				$commentAuthorId = $articleModel->checkCommentPosterByCommentId($postId);
				if (isset($_POST['delete']) && ($uidFromSession == $commentAuthorId)) {
		            $articleModel->deleteCommentById($postId);
		            echo json_encode(['content' => '[deleted]']);
		        } elseif (isset($_POST['edit']) && ($uidFromSession == $commentAuthorId)) {
		        	$articleModel->commentDatabaseWork($_POST['content'], $_POST['id']);
		        }
			}

			if (isset($_POST['newComment']) && $uidFromSession != 0) {
				$newCommentData = [
					"postId" => $registry->request['id'],
					"parent" => (int)$_POST['parent'],
					"content" => htmlentities($_POST['content']),
					"userId" => (int)$uidFromSession
				];
				if($newCommentData['content'] != '')
					$articleModel->addCommentToDatabase($newCommentData);
				
				$newCommentData['username'] = $articleModel->userIdToUsername($newCommentData['userId']);
				$newCommentData['lastCommId'] = $articleModel->returnLastCommentIdOfUserByUserId($newCommentData['userId']);

				echo json_encode($newCommentData);
			}
	        exit;

	    }
		break;
	case 'add':
		$uidFromSession = $session->user->id;
		if($_SERVER['REQUEST_METHOD'] == 'POST' && (isset($uidFromSession) && !empty($uidFromSession))) {
			$ok = preg_match("/(http\:\/\/|https\:\/\/)/", $_POST['content']);

			if(isset($_POST['type']) && !empty($_POST['type'])) {
				if($_POST['type'] == 'on' && $ok == 0) {
					$content = 'http://' . trim($_POST['content']);
				} else {
					$content = trim($_POST['content']);
				}
			} else {
				$content = trim($_POST['content']);
			}
			$title = $_POST['title'];
			$sub = $_POST['sub'];
			$valid = Zend_Uri::check($content);
			if($valid == true) {
				$type = 1;
			} else {
				$type = 0;
			}
			if($type == 1) {
				$content = str_replace('https://','http://', $content);
			}
			$data = [
				'title' => $title,
				'sub' => $sub,
				'type' => $type,
				'content' => $content,
				'authorId' => $uidFromSession
			];
			$articleModel->addNewPostToDatabase($data);
		} elseif (!isset($uidFromSession) || empty($uidFromSession)) {
			header('location: '.$registry->configuration->website->params->url.'/user/login');
		}
		$articleView->useTemplate('add_article');
		break;
}