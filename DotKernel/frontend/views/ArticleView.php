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
                $this->tpl->setVar('ARTICLE_'.strtoupper($key), strtoupper($value));
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

        foreach ($commentData as $commentKey => $comment) {

            $this->tpl->setVar('COMMENT_USERID',$comment['username']);
            $this->tpl->setVar('COMMENT_ID',$commentKey);
            $this->tpl->setVar('COMMENT_CONTENT',$comment['content']);
            if(isset($this->session->user->id)) {
                if ($comment['userId'] == $this->session->user->id) {
                    $this->tpl->setVar('COMMENT_ID',$commentKey);
                    $this->tpl->parse('comment_controls_block','comment_controls',true);
                } else {
                    $this->tpl->parse('comment_controls_block','',false);
                }
            }
            // we emplty the block before we make any changes, 
            // just in case this block was already set in a previous loop from the foreach
            $this->tpl->parse('comment_reply_block','');
            if(isset($comment['replies'])) {
                foreach($comment['replies'] as $replyKey => $reply) {
                    $this->tpl->setVar('REPLY_USERNAME',$reply['username']);
                    $this->tpl->setVar('REPLY_ID',$reply['id']);
                    $this->tpl->setVar('REPLY_CONTENT',$reply['content']);
                    if(isset($this->session->user->id)) {
                        if ($reply['userId'] == $this->session->user->id) {
                            $this->tpl->setVar('REPLY_ID',$reply['id']);
                            $this->tpl->parse('reply_controls_block','reply_controls',false);
                        } else {
                            $this->tpl->setVar('REPLY_ID','');
                            $this->tpl->parse('reply_controls_block','',false);
                        }
                    }
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
}