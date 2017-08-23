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
        $this->tpl->setBlock('article_list','article_like_controls','article_like_controls_block');
        if(isset($this->session->user->id)) {
            $this->tpl->parse('article_like_controls_block','article_like_controls',false);
        } else {
            $this->tpl->parse('article_like_controls_block','',false);
        }
        foreach ($data as $separateArticle) {
            if(isset($separateArticle['articleRating'])) {
                if($separateArticle['articleRating'] != 0) {
                    if($separateArticle['articleRating'] > 0) {
                        $this->tpl->setVar('ARTICLE_LIKE_STYLE_UP','filter: grayscale(0);');
                        $this->tpl->setVar('ARTICLE_LIKE_STYLE_DOWN','filter: grayscale(1);');
                        $this->tpl->setVar('ARTICLE_LIKE_ON_UP','1');
                        $this->tpl->setVar('ARTICLE_LIKE_ON_DOWN','0');

                    } else {
                        $this->tpl->setVar('ARTICLE_LIKE_STYLE_UP','filter: grayscale(1);');
                        $this->tpl->setVar('ARTICLE_LIKE_STYLE_DOWN','filter: grayscale(0);');
                        $this->tpl->setVar('ARTICLE_LIKE_ON_UP','0');
                        $this->tpl->setVar('ARTICLE_LIKE_ON_DOWN','1');
                    }
                } else {
                    $this->tpl->setVar('ARTICLE_LIKE_ON_UP','0');
                    $this->tpl->setVar('ARTICLE_LIKE_ON_DOWN','0');
                    $this->tpl->setVar('ARTICLE_LIKE_STYLE_UP','filter: grayscale(1);');
                    $this->tpl->setVar('ARTICLE_LIKE_STYLE_DOWN','filter: grayscale(1);');
                }
            }
            if($separateArticle['type'] == 0) {
                $this->tpl->setVar('SET_BY_TYPE', "article/show_article_content/id/" . $separateArticle['id']);
            } else {
                $ok = preg_match("/http\:\/\//", $separateArticle['content']);
                $pref = '';
                if($ok == 0) {
                    $pref = 'http://';
                }
                $this->tpl->setVar('SET_BY_TYPE', $pref . $separateArticle['content']);
            }
            foreach($separateArticle as $key => $value) {
                $this->tpl->setVar('ARTICLE_'.strtoupper($key), strtoupper($value));
            }
            $this->tpl->parse('article_list_block','article_list',true);
        }
        $this->tpl->setVar('POST_COUNT', count($data));
    }
    
    public function useTemplate($template = '')
    {
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
    }
    /*
    Displays one single article, with all of it's data
    on the specified template.
    Also displays the comment submission form, given
    that the user is signed in.
    */
    public function showSingleArticle($template = '', $data, $commentData, $likeData)
    {
        if($template != '') {
            $this->template = $template;
        }

        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
        $this->tpl->setBlock('tpl_main','comment_display','comment_display_block');
        $this->tpl->setBlock('tpl_main','comment_submit','comment_submit_block');
        $this->tpl->setBlock('comment_display','comment_reply','comment_reply_block');
        $this->tpl->setBlock('comment_display','comment_like_controls','comment_like_controls_block');
        $this->tpl->setBlock('comment_display','comment_controls','comment_controls_block');
        $this->tpl->setBlock('comment_display','comment_replyToComment','comment_replyToComment_block');
        $this->tpl->setBlock('comment_reply','reply_controls','reply_controls_block');
        $this->tpl->setBlock('comment_reply','reply_like_controls','reply_like_controls_block');



        $extensions = ['.jpg', '.jpeg', '.png', '.gif'];

        foreach($data as $key => $value) {
            if($key == 'date') {
                $value = date('Y - m - d', strtotime($value));
            }
            if($key == 'type' && $value == 1) {

                $data['content'] = str_replace('https://','http://', $data['content']);
                $ok = preg_match("/(http\:\/\/(i\.)?imgur\.com\/)(.+)/", $data['content'], $toUse);
                if($ok) {
                    if($toUse[1] == "http://imgur.com/") {
                        $toUse[3] = str_replace('gallery/','a/', $toUse[3]);
                        $this->tpl->setVar('ARTICLE_CONTENT', '<blockquote class="imgur-embed-pub" lang="en" data-id="'.$toUse[3].'"><a href="http://imgur.com/a/'.$toUse[3].'"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>');
                    } else {
                        $toUse[3] = str_replace($extensions,'', $toUse[3]);
                        $this->tpl->setVar('ARTICLE_CONTENT', '<blockquote class="imgur-embed-pub" lang="en" data-id="'.$toUse[3].'"><a href="//imgur.com/'.$toUse[3].'"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>');

                    }
                } else {
                    $this->tpl->setVar('ARTICLE_CONTENT','<a href="http://'.$data['content'].'">'.$data['content'].'</a>');
                }
            }
            $this->tpl->setVar('ARTICLE_'.strtoupper($key), $value);
        }

        if(isset($this->session->user->id)) {
            $this->tpl->parse('comment_submit_block','comment_submit',false);
        } else {
            $this->tpl->parse('comment_submit_block','',false);            
        }

        foreach ($commentData as $commentKey => $comment) {
            // Zend_Debug::dump($commentKey);exit;
            if(isset($likeData[$commentKey])) {
                if($likeData[$commentKey] > 0) {
                    $this->tpl->setVar('COMMENT_LIKE_STYLE_UP','filter: grayscale(0);');
                    $this->tpl->setVar('COMMENT_LIKE_STYLE_DOWN','filter: grayscale(1);');
                    $this->tpl->setVar('COMMENT_LIKE_ON_UP','1');
                    $this->tpl->setVar('COMMENT_LIKE_ON_DOWN','0');

                } else {
                    $this->tpl->setVar('COMMENT_LIKE_STYLE_UP','filter: grayscale(1);');
                    $this->tpl->setVar('COMMENT_LIKE_STYLE_DOWN','filter: grayscale(0);');
                    $this->tpl->setVar('COMMENT_LIKE_ON_UP','0');
                    $this->tpl->setVar('COMMENT_LIKE_ON_DOWN','1');
                }
            } else {
                $this->tpl->setVar('COMMENT_LIKE_ON_UP','0');
                $this->tpl->setVar('COMMENT_LIKE_ON_DOWN','0');
                $this->tpl->setVar('COMMENT_LIKE_STYLE_UP','filter: grayscale(1);');
                $this->tpl->setVar('COMMENT_LIKE_STYLE_DOWN','filter: grayscale(1);');
            }
            $this->tpl->setVar('COMMENT_USERID',$comment['username']);
            $this->tpl->setVar('COMMENT_ID',$commentKey);
            $this->tpl->setVar('COMMENT_LIKE_COUNT',$comment['likeCount']);
            $valid = Zend_Uri::check($comment['content']);
            if($valid == true) {
                $this->tpl->setVar('COMMENT_CONTENT',"<a href=" . $comment['content'] . ">" . $comment['content'] . "</a>");
            } else {
                $this->tpl->setVar('COMMENT_CONTENT',$comment['content']);
            }
            
            if(isset($this->session->user->id)) {
                $this->tpl->parse('comment_replyToComment_block','comment_replyToComment',false);
                $this->tpl->parse('comment_like_controls_block','comment_like_controls',false);
                if ($comment['userId'] == $this->session->user->id) {
                    $this->tpl->setVar('COMMENT_ID',$commentKey);
                    $this->tpl->parse('comment_controls_block','comment_controls',false);
                } else {
                    $this->tpl->parse('comment_controls_block','',false);
                }
            } else {
                $this->tpl->parse('comment_replyToComment_block','',false);
            }
            // we emplty the block before we make any changes, 
            // just in case this block was already set in a previous loop from the foreach
            $this->tpl->parse('comment_reply_block','');
            if(isset($comment['replies'])) {
                foreach($comment['replies'] as $replyKey => $reply) {
                    if(isset($likeData[$reply['id']])) {
                        if($likeData[$reply['id']] > 0) {
                            $this->tpl->setVar('REPLY_LIKE_STYLE_UP','filter: grayscale(0);');
                            $this->tpl->setVar('REPLY_LIKE_STYLE_DOWN','filter: grayscale(1);');
                            $this->tpl->setVar('REPLY_LIKE_ON_UP','1');
                            $this->tpl->setVar('REPLY_LIKE_ON_DOWN','0');

                        } else {
                            $this->tpl->setVar('REPLY_LIKE_STYLE_UP','filter: grayscale(1);');
                            $this->tpl->setVar('REPLY_LIKE_STYLE_DOWN','filter: grayscale(0);');
                            $this->tpl->setVar('REPLY_LIKE_ON_UP','0');
                            $this->tpl->setVar('REPLY_LIKE_ON_DOWN','1');
                        }
                    } else {
                        $this->tpl->setVar('REPLY_LIKE_ON_UP','0');
                        $this->tpl->setVar('REPLY_LIKE_ON_DOWN','0');
                        $this->tpl->setVar('REPLY_LIKE_STYLE_UP','filter: grayscale(1);');
                        $this->tpl->setVar('REPLY_LIKE_STYLE_DOWN','filter: grayscale(1);');
                    }
                    $this->tpl->setVar('REPLY_USERNAME',$reply['username']);
                    $this->tpl->setVar('REPLY_ID',$reply['id']);
                    $this->tpl->setVar('REPLY_LIKE_COUNT',$reply['likeCount']);
                    $valid = Zend_Uri::check($reply['content']);
                    if($valid == true) {
                        $this->tpl->setVar('REPLY_CONTENT',"<a href=" . $reply['content'] . ">" . $reply['content'] . "</a>");
                    } else {
                        $this->tpl->setVar('REPLY_CONTENT',$reply['content']);
                    }
                    if(isset($this->session->user->id)) {
                        $this->tpl->parse('reply_like_controls_block','reply_like_controls',false);
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
        // var_dump($this->template);
        $this->tpl->setBlock('tpl_main','comment_display','comment_display_block');
        foreach ($data as $separateComment) {
            foreach($separateComment as $key => $value) {
                $this->tpl->setVar('COMMENT_'.strtoupper($key), $value);
            }
            $this->tpl->parse('comment_display_block','comment_display',true);
        }
    }
}