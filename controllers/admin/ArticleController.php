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
// all actions MUST set  the variable  $pageTitle
$pageTitle = $option->pageTitle->action->{$registry->requestAction};
switch ($registry->requestAction)
{
	default:
	case 'list':
		if($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = $_POST['id'];
			$articleModel->deleteArticleById($data);
		}
		$page = (isset($registry->request['page']) && $registry->request['page'] > 0) ? $registry->request['page'] : 1;
		$list = $articleModel->getArticleList($page);
		$articleView->listArticles('list', $list, $page);
		break;
	case 'add':
		if($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = ['content' => $_POST['content']];
			$articleModel->addArticleToDatabase($data);
		}
		$articleView->useTemplate('add_article');
		break;
	case 'edit':
		$id = $registry->request['id'];
		$articleData = $articleModel->getArticleById($registry->request['id']);
		if($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = ['content' => $_POST['content']];
			$articleModel->addArticleToDatabase($data, $id);
			$baseUrl = $registry->configuration->website->params->url;
			header('Location:' . $baseUrl . '/admin/article/list');
			exit;
		}
		$articleView->showSingleArticle('edit_article', $articleData);
		break;
	case 'delete':
		break;
	case 'show':
		$articleData = $articleModel->getArticleById($registry->request['id']);
		$articleView->showSingleArticle('show_article_content', $articleData);
		break;
}