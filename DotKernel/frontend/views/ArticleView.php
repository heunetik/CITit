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
    public function showSingleArticle($template = '', $data)
    {
        // Zend_debug::dump($data);die;
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
        foreach($data as $key => $value) {
            //echo 'ARTICLE_'.strtoupper($key)." - ".$value."<br>";
            $this->tpl->setVar('ARTICLE_'.strtoupper($key), $value);
        }
        // Zend_Debug::dump($this->session->userData);
        $this->tpl->setBlock('tpl_main','comment_display','comment_display_block');

        if($this->session->user) {
            $this->tpl->parse('comment_display_block','comment_display', true);
        } else {
            $this->tpl->parse('comment_display_block','');
        }
    }
}