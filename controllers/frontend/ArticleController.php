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
		$articleData = $articleModel->getAllArticleData();
		$articleView->showArticles('show_articles', $articleData);
		break;

	case 'show_article_content':

		$articleData = $articleModel->getSingleArticleData($registry->request['id']);
		$articleCommentAndReply = $articleModel->getCommentByArticleId($registry->request['id']);
		if($articleData != 0) {
			$articleView->showSingleArticle('show_article_content', $articleData, $articleCommentAndReply);
		} else {
			header('location: '.$registry->configuration->website->params->url.'/show_articles');
			exit;
		}

		if($_SERVER['REQUEST_METHOD'] == 'POST') {

			$uidFromSession = $session->user->id;

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
}