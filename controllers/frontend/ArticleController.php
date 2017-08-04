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
	case 'show_articles':
		$articleData = $articleModel->getAllArticleData();
		$articleView->showArticles('show_articles', $articleData);
		break;
	case 'show_article_content':
		// var_dump($registry->request);exit;
		$articleData = $articleModel->getSingleArticleData($registry->request['id']);
		$articleCommentAndReply = $articleModel->getCommentByArticleId($registry->request['id']);
		$articleView->showSingleArticle('show_article_content', $articleData, $articleCommentAndReply);
		break;
}