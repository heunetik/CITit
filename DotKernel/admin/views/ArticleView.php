<?php
/**
 * DotBoost Technologies Inc.
 * DotKernel Application Framework
 *
 * @category   DotKernel
 * @copyright  Copyright (c) 2009-2015 DotBoost Technologies Inc. (http://www.dotboost.com)
 * @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @version    $Id: UserView.php 981 2015-06-11 13:51:41Z gabi $
 */
/**
 * Article View Class
 * class that prepare output related to Article controller 
 * @category   DotKernel
 * @package    Frontend
 * @author     DotKernel Team <team@dotkernel.com>
 */
class Article_View extends View
{
    /**
     * Constructor
     * @access public
     * @param Dot_Template $tpl
     */
    public function __construct($tpl)
    {
        $this->tpl = $tpl;
        $this->settings = Zend_Registry::get('settings');
        $this->session = Zend_Registry::get('session');
    }
    /*
    Displays every article contained in $data
    on the specified template.
    (handled as a "$separateArticle", and parsed as one)
    */
    public function showArticles($template = '', $data)
    {
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
        $this->tpl->setBlock('tpl_main','article_list','article_list_block');
       
        
        foreach ($data as $separateArticle) {
            foreach($separateArticle as $key => $value) {
//                 Zend_Debug::dump($value, $label=null, $echo=true);exit;
          
                $this->tpl->setVar('ARTICLE_'. strtoupper($key), $value);
            }
            $this->tpl->parse('article_list_block','article_list',true);
        }
        $this->tpl->setVar('ARTICLE_COUNT', count($data));
    }
    /*
    Displays one single article, with all of it's data
    on the specified template.
    Also displays the comment submission form, given
    that the user is signed in.
    */
    public function showSingleArticle($template = '', $data, $commentData)
    {
        
        $admin = new Admin();
//         Zend_Debug::dump($data, $label=null, $echo=true);exit();
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
        $this->tpl->setBlock('tpl_main','comment_display','comment_display_block');
        $this->tpl->setBlock('comment_display','comment_reply','comment_reply_block');
        $this->tpl->setBlock('comment_display','comment_controls','comment_controls_block');
        $this->tpl->setBlock('comment_reply','reply_controls','reply_controls_block');
        
        foreach($data as $key => $value) {
          
            $this->tpl->setVar('ARTICLE_'.strtoupper($key), $value);
        }
        
//         Zend_Debug::dump($commentData, $label=null, $echo=true);
        
        foreach ($commentData as $commentKey => $comment) {

            //verify if the comment is posted by an admin
            //if yes it means the value from the admin field from 'comments' is set to Y, by default the value is set to 'N'
            if($comment['admin'] == 'Y')
            { 
                $usernameAdmin = $admin->getUserBy('id', $comment['userId']);
                $this->tpl->setVar('COMMENT_USERID',$usernameAdmin['username']);
            }
            else 
            {
                $this->tpl->setVar('COMMENT_USERID',$comment['username']);
            }
            
            $this->tpl->setVar('COMMENT_ID',$comment['id']);
            $this->tpl->setVar('COMMENT_CONTENT',$comment['content']);
           // if(isset($this->session->user->id)) {
               // if ($comment['userId'] == $this->session->user->id) {
                   // $this->tpl->setVar('COMMENT_ID',$commentKey);
                    $this->tpl->parse('comment_controls_block','comment_controls',false);
               // } else {
               //     $this->tpl->parse('comment_controls_block','',false);
              //  }
           // }
            // we empty the block before we make any changes, 
            // just in case this block was already set in a previous loop from the foreach
            $this->tpl->parse('comment_reply_block','');
            if(isset($comment['replies'])) {
                
//             
                foreach($comment['replies'] as $replyKey => $reply) {
                    
                    //verify if the reply is posted by an admin
                    //if yes it means the value from the admin field from 'comments' is set to Y, by default the value is set to 'N'
                    if($reply['admin'] == 'Y')
                    {  
                        $usernameAdmin = $admin->getUserBy('id', $reply['userId']);
//                         Zend_Debug::dump($usernameAdmin, $label=null, $echo=true);exit;
                        $this->tpl->setVar('REPLY_USERNAME',$usernameAdmin['username']);
                    }
                    else 
                    {
                        $this->tpl->setVar('REPLY_USERNAME',$reply['username']);
                    }
                    
                    $this->tpl->setVar('REPLY_ID', $reply['id']);
                    $this->tpl->setVar('REPLY_CONTENT',$reply['content']);
                   // if(isset($this->session->user->id)) {
                       // if ($reply['userId'] == $this->session->user->id) {
                           // $this->tpl->setVar('REPLY_ID',$reply['id']);
                            $this->tpl->parse('reply_controls_block','reply_controls',false);
                       // } else {
                       //     $this->tpl->setVar('REPLY_ID','');
                     //       $this->tpl->parse('reply_controls_block','',false);
                       // }
                   // }
                    $this->tpl->parse('comment_reply_block','comment_reply',true);
                }
            }
            $this->tpl->parse('comment_display_block','comment_display',true);
        }
    }
    /*
    Displays all the comments on the article.
    */
    public function showArticleComments($template = '', $data)
    {
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
        var_dump($this->template);
        $this->tpl->setBlock('tpl_main','comment_display','comment_display_block');
        foreach ($data as $separateComment) {
            foreach($separateComment as $key => $value) {
                $this->tpl->setVar('COMMENT_'.strtoupper($key), $value);
            }
            $this->tpl->parse('comment_display_block','comment_display',true);
        }
    }
    //set template using for Add and Delete content
    public function addContent($template='')
    {
        if($template!='') $this->template = $template;
        $this->tpl->setFile('tpl_main', 'article/' .$template. ".tpl");
    }
    //set template for Edit content
    public function showArticleEdit($template='', $data)
    {
        if($template!='') $this->template = $template;
        $this->tpl->setFile('tpl_main', 'article/' . $template. ".tpl");
        
        foreach ($data as $key => $value) {
            
            $this->setVar(strtoupper('ARTICLE_' . $key), $value);
        }
    }
    /**
     * Display delete form page
     *  for deleting an Article
     * @access public
     * @param string $template
     * @param $data
     * @return true
     */
    
    public function showDeleteArticle($template = '', $data)
    {
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main', 'article/' . $template . ".tpl");
    
        foreach($data as $key => $value)
        {
            $this->tpl->setVar(strtoupper('ARTICLE_' . $key), $value);
        }
    }
    
    /**
     * Display delete form page
     * for deleting a comment
     * @access public
     * @param string $template
     * @param $data       
     * @return true
     */
    public function showDeleteCommentPage($template = '', $data)
    {
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main', 'article/' . $template . '.tpl');
        
        foreach ($data as $key => $value)
        {
            $this->tpl->setVar(strtoupper('COMMENT_' . $key), $value);
        }
    }
    
    /**
     * Display delete form page
     * for deleting a comment
     * @access public
     * @param string $template
     * @param $data
     * @return true
     */
    public function showDeleteReplyPage($template = '', $data)
    {
        
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main', 'article/' . $template . '.tpl');
        
//         Zend_Debug::dump($data, $label=null, $echo=true);exit;
        
        foreach ($data as $key => $value)
        {
            $this->tpl->setVar(strtoupper('REPLY_' . $key), $value);
        }
         
    }
    
    /**
     * Display update form page
     *for editing/update a comment
     * @access public
     * @param string $template
     * @param $data
     *        	 
     * @return true
     */
    public function showEditCommentPage($template = '', $data)
    {
    
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main', 'article/' . $template . '.tpl');
        
        foreach ($data as $key => $value)
        {
            $this->tpl->setVar(strtoupper('COMMENT_' . $key), $value);
        }
    }
    
    public function showEditReplyPage($template = '', $data)
    {
    
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main', 'article/' . $template . '.tpl');
    
        foreach ($data as $key => $value)
        {
            $this->tpl->setVar(strtoupper('REPLY_' . $key), $value);
        }
    }
    
}