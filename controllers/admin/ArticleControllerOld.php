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

$baseUrl = $registry->configuration->website->params->url;

$page = (isset($registry->request['page'])) ? $registry->request['page'] : 1;
switch ($registry->requestAction)
{
	default:
	case 'show_articles':
	    
		$articleData = $articleModel->getAllArticleData($page);
// 		Zend_Debug::dump($articleData, $label=null, $echo=true);exit;
		
		$articleView->showArticles('show_articles', $articleData);
		break;

	case 'show_article_content':
	    
		$articleData = $articleModel->getSingleArticleData($registry->request['id']);
		$articleCommentAndReply = $articleModel->getCommentByArticleId($registry->request['id']);
		
		if($_SERVER['REQUEST_METHOD'] == 'POST') {
		    
// 			Zend_Debug::dump($_POST, $label=null, $echo=true);exit;
			$postId = (int)$_POST['id'];
			
			$commentAuthorId = $articleModel->checkCommentPosterByCommentId($postId);
			
			$uidFromSession = $session->user->id;
	        if (isset($_POST['delete']) && ($uidFromSession == $commentAuthorId)) {
	            $articleModel->deleteCommentById($postId);
	            echo json_encode(['content' => '[deleted]']);
	        } elseif (isset($_POST['content']) && ($uidFromSession == $commentAuthorId)) {
	        	$articleModel->commentDatabaseWork($_POST['content'], $_POST['id']);
	        }
	        exit;
	    }
	    $articleView->showSingleArticle('show_article_content', $articleData, $articleCommentAndReply);
		break;

	case 'delete':
		if(isset($registry->request['id'])) {
			$articleModel->deleteArticle($registry->request['id']);
			header('Location:' . $baseUrl . '/admin/article/list');
			exit;
		} else {
		header('Location:' . $baseUrl . '/admin/article/list');
		}
			break;

	case 'add':
		if ($_SERVER["REQUEST_METHOD"]=="POST") {
			$articleModel->addArticle($_POST);
			
			header('Location:' . $baseUrl . '/admin/article/show/id/{ARTICLE_ID}');
			exit;
		}
		$articleView->addContent("add_article");
		
		break;

	case 'delete_Comment':
		if(isset($registry->request['id'])) {
			$articleModel->deleteCommentAndReplay($registry->request['id']);
			header('Location:' . $baseUrl . '/admin/article/show/id/{ARTICLE_ID}');
			exit;
		} else {
			header('Location:' . $baseUrl . '/admin/article/show/id/{ARTICLE_ID}');
		}
		break;

	case 'test':
		$id = (isset($_POST['id'])) ? $_POST['id'] : '';
		$replies = $articleModel->getCommentReplytByCommentId($id);
		if(!empty($replies))
		{
			foreach($replies as $reply)
			{
				$articleModel->deleteCommentAndReplay($reply['id']);
			}
			$articleModel->deleteCommentAndReplay($id);
		} else {
			$articleModel->deleteCommentAndReplay($id);
			
		}
		break;

	case 'edit_title':
		$id=$registry->request['id'];
		$article=$articleModel->getArticleById($id);
		if ($_SERVER["REQUEST_METHOD"]=="POST") {
				$articleModel->updateArticle($_POST,$id);
		header('Location:' . $baseUrl . '/admin/article/list/');
			}
			$articleModel->commentDatabaseWork($_POST,$id);
		$articleView->showArticleEdit('edit_article',$article);
	break;
		
}