<?php

$articleView = new Article_View($tpl);

$articleModel = new Article();

$pageTitle = $option->pageTitle->action->{$registry->requestAction};

$page = (isset($registry->request['page'])) ? $registry->request['page'] : 1;

$baseUrl = $registry->configuration->website->params->url;

$postId = (isset($registry->request['id'])) ? $registry->request['id'] : '';

switch ($registry->requestAction)
{
    default:
    case 'show_articles':

        $articleData = $articleModel->getAllArticleData();
        $articleView->showArticles('show_articles', $articleData);

        break;

    case 'show_single_article':

        $articleData = $articleModel->getSingleArticleData($registry->request['id']);
        $articleCommentAndReply = $articleModel->getCommentByArticleId($registry->request['id']);
        
//         Zend_Debug::dump($articleCommentAndReply, $label=null, $echo=true);exit;

        $articleView->showSingleArticle('show_single_article', $articleData, $articleCommentAndReply);

        break;

    case 'add_article':

        if ($_SERVER["REQUEST_METHOD"]=="POST") {
            $articleModel->addArticle($_POST);

            header('Location:' . $baseUrl . '/admin/article/show/id/{ARTICLE_ID}');
            exit;
        }
        $articleView->addContent("add_article");

        break;


    case 'comment':
    case 'reply':

//         $postId =  (isset($registry->request['id'])) ? $registry->request['id'] : '';
        $article = $articleModel->getArticleById($postId);

        if($registry->requestAction == 'comment')
        {
            $postId =  (isset($registry->request['id'])) ? $registry->request['id'] : '';
            $article = $articleModel->getArticleById($postId);

        }

        if($registry->requestAction == 'reply')
        {
//             Zend_Debug::dump($postId, $label=null, $echo=true);exit;
            //get the comment and the video were the reply will be
            $shit = $articleModel->getCommentById($_POST['parent']);
//             $post = $articleModel->getArticleById($comment['postId']);
//             Zend_Debug::dump($shit, $label=null, $echo=true);exit('ds');


        }

        if($_SERVER['REQUEST_METHOD'] == 'POST')
        {
            $commentId = 0;
//             Zend_Debug::dump($_POST, $label=null, $echo=true);exit;
            if($registry->requestAction == 'comment')
            {
                $comment['postId'] = $postId;
                $comment['parent'] = $commentId;
                $comment['content'] = (isset($_POST['content'])) ? $_POST['content'] : '';
                $comment['userId'] = $registry->session->admin->id;
                $comment['date'] = date('Y-m-d h:i:sa');
                $comment['admin'] = 'Y';
                
//                 Zend_Debug::dump($comment, $label=null, $echo=true);exit;
                
                $articleModel->insertComment($comment);
                header('Location:' . $baseUrl . '/admin/article/show_single_article/id/' . $comment['postId']);
            }

            if($registry->requestAction == 'reply')
            {
//                 Zend_Debug::dump($comment['postId'], $label=null, $echo=true);exit;
                $comment['postId'] = $shit['postId'];
                $comment['parent'] = (isset($_POST['parent'])) ? $_POST['parent'] : '';
                $comment['content'] = (isset($_POST['content_reply'])) ? $_POST['content_reply'] : '';
                
                //to see which admin is logged $registry->session->admin->id; or Dot_Auth::getInstance()->_identity->id;
                $comment['userId'] = $registry->session->admin->id;
                $comment['date'] = date('Y-m-d h:i:sa');
                $comment['admin'] = 'Y';

//                 Zend_Debug::dump($registry->session->admin->id, $label=null, $echo=true);exit;
//                 Zend_Debug::dump($comment, $label=null, $echo=true); exit();
                $succes = $articleModel->insertComment($comment);

                if($succes)
                {
                    header('Location:' . $baseUrl . '/admin/article/show_single_article/id/' . $comment['postId']);
                }
                else {
                    $registry->session->message['txt'] = 'reply was not inserted';
                    $registry->session->message['type'] = 'error';
                }

            }



        }



        break;

    case 'edit_article':

        $id = (isset($registry->request['id'])) ? $registry->request['id'] : '';
//         Zend_Debug::dump($id, $label=null, $echo=true);exit;
        $article = $articleModel->getArticleById($id);
//         Zend_Debug::dump($article, $label=null, $echo=true);exit;
        if ($_SERVER["REQUEST_METHOD"]=="POST") {

//             Zend_Debug::dump($_POST, $label=null, $echo=true);exit;
            $article['content'] = (isset($_POST['content'])) ? $_POST['content'] : '';
            $article['date'] = date('Y-m-d h:i:sa');

//             Zend_Debug::dump($id, $label=null, $echo=true);

            $articleModel->updateArticle($id, $article);
            header('Location:' . $baseUrl . '/admin/article/show_articles/');
        }

//         Zend_Debug::dump($article, $label=null, $echo=true);exit();
        $articleModel->commentDatabaseWork($_POST,$id);
        $articleView->showArticleEdit('edit_article', $article);

        break;

    case 'delete_article':


        $articleId = (isset($registry->request['id'])) ? $registry->request['id'] : '';
        $data = $articleModel->getArticleById($articleId);
//         Zend_Debug::dump($_POST['confirm'], $label=null, $echo=true);exit;exit;
        if(count($_POST) > 0)
        {
            if(isset($_POST['confirm']) && $_POST['confirm'] == "on")
            {

                 $articleModel->deleteArticle($articleId);
                //                 Zend_Debug::dump($succes, $label=null, $echo=true);exit;
                    $registry->session->message['txt'] = 'Succes';
                    $registry->session->message['type'] = 'info';
            }
            else
            {
                $registry->session->message['txt'] = 'Article was not deleted';
                $registry->session->message['type'] = 'error';
            }

                header('Location:' . $baseUrl . '/admin/article/show_articles/');
                exit;
            }

        $articleView->showDeleteArticle('delete_article', $data);

        break;

    case 'delete_comment':


//         $commentId = (isset($registry->request['id'])) ? $registry->request['id'] : '';
//         $comment = $articleModel->getCommentById($commentId);
//         if($registry->requestAction == 'delete_comment')
//         {
            $commentId = (isset($registry->request['id'])) ? $registry->request['id'] : '';

            $comment = $articleModel->getCommentById($commentId);
            //         Zend_Debug::dump($baseUrl . '/admin/article/show_single_article/id/' . $comment['postId'], $label=null, $echo=true);exit;
            if(count($_POST) > 0)
            {
                if(isset($_POST['confirm']) && $_POST['confirm'] == "on")
                {

                    $articleModel->deleteComment($commentId);

                    $registry->session->message['txt'] = 'Succes';
                    $registry->session->message['type'] = 'info';

                }
                else
                {
                    $registry->session->message['txt'] = 'Comment was not deleted';
                    $registry->session->message['type'] = 'error';
                }

                header('Location:' . $baseUrl . '/admin/article/show_single_article/id/' . $comment['postId']);
                exit;
            }


            $articleView->showDeleteCommentPage('delete_comment', $comment);
//         }

//         if ($registry->requestAction == "delete_reply")
//         {


//             $replyList = $articleModel->getCommentReplytByCommentId($commentId);
//            Zend_Debug::dump($replyList, $label=null, $echo=true);exit;
//         }
        break;



    case 'edit_comment':


        $commentId = (isset($registry->request['id'])) ? $registry->request['id'] : '';
        //         Zend_Debug::dump($id, $label=null, $echo=true);exit;
        $comment = $articleModel->getCommentById($commentId);
        //         Zend_Debug::dump($article, $label=null, $echo=true);exit;
        if ($_SERVER["REQUEST_METHOD"]=="POST") {

//                         Zend_Debug::dump($_POST, $label=null, $echo=true);exit;
            $comment['content'] = (isset($_POST['content'])) ? $_POST['content'] : '';
            $comment['date'] = date('Y-m-d h:i:sa');

//             Zend_Debug::dump($comment, $label=null, $echo=true);exit;

            $articleModel->updateComment($commentId, $comment);
            header('Location:' . $baseUrl . '/admin/article/show_single_article/id/' . $comment['postId']);
            exit;
        }

        //         Zend_Debug::dump($article, $label=null, $echo=true);exit();
//         $articleModel->commentDatabaseWork($_POST,$id);
        $articleView->showEditCommentPage('edit_comment', $comment);

        break;

    case 'delete_reply':


        $replyId = (isset($registry->request['id'])) ? $registry->request['id'] : '';
//         Zend_Debug::dump($replyId, $label=null, $echo=true);exit;

        $reply = $articleModel->getReply($replyId);
        //         Zend_Debug::dump($baseUrl . '/admin/article/show_single_article/id/' . $comment['postId'], $label=null, $echo=true);exit;
        if(count($_POST) > 0)
        {
            if(isset($_POST['confirm']) && $_POST['confirm'] == "on")
            {

                $articleModel->deleteReply($replyId);

                $registry->session->message['txt'] = 'Succes';
                $registry->session->message['type'] = 'info';

            }
            else
            {
                $registry->session->message['txt'] = 'Comment was not deleted';
                $registry->session->message['type'] = 'error';
            }

            header('Location:' . $baseUrl . '/admin/article/show_single_article/id/' . $reply['postId']);
            exit;
        }


        $articleView->showDeleteReplyPage('delete_reply', $reply);
        //         }

        //         if ($registry->requestAction == "delete_reply")
            //         {


            //             $replyList = $articleModel->getCommentReplytByCommentId($commentId);
            //            Zend_Debug::dump($replyList, $label=null, $echo=true);exit;
            //         }

        break;

    case 'edit_reply':

        $replyId = (isset($registry->request['id'])) ? $registry->request['id'] : '';
        //         Zend_Debug::dump($id, $label=null, $echo=true);exit;
        $reply = $articleModel->getReply($replyId);
        //         Zend_Debug::dump($article, $label=null, $echo=true);exit;
        if ($_SERVER["REQUEST_METHOD"]=="POST") {

//                Zend_Debug::dump($_POST, $label=null, $echo=true);exit;
            $reply['content'] = (isset($_POST['content'])) ? $_POST['content'] : '';
            $reply['date'] = date('Y-m-d h:i:sa');

//                         Zend_Debug::dump($reply, $label=null, $echo=true);exit;

            $articleModel->updateComment($replyId, $reply);
            header('Location:' . $baseUrl . '/admin/article/show_single_article/id/' . $reply['postId']);
            exit;
        }

        //         Zend_Debug::dump($article, $label=null, $echo=true);exit();
        //         $articleModel->commentDatabaseWork($_POST,$id);
        $articleView->showEditCommentPage('edit_reply', $reply);

        break;

    case 'like' :
        $artId = (isset($registry->request['id'])) ? $registry->request['id'] : '';
        // Zend_Debug::dump($artId, $label=null, $echo=true);exit();
        $like = $articleModel->likeOrDislike($artId,'1');
        // Zend_Debug::dump($like, $label=null, $echo=true);exit();
        $articleView->showLike('like',$like);
    break;

    case 'dislike':
        $artId = (isset($registry->request['id'])) ? $registry->request['id'] : '';
        $dislike = $articleModel->likeOrDislike($artId,'-1');
        $articleView->showDislike('dislike',$dislike);
    break;
}
