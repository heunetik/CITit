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
    public function __construct($tpl)
    {
        $this->tpl = $tpl;
        $this->settings = Zend_Registry::get('settings');
        $this->session = Zend_Registry::get('session');
    }
    public function listArticles($template = '', $data, $page)
    {
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
        $this->tpl->setBlock('tpl_main','article_list','article_list_block');
        $this->tpl->paginator($data['pages']);
        $this->tpl->setVar('PAGE',$page);
        foreach ($data['data'] as $separateArticle) {
            foreach($separateArticle as $key => $value) {
                if($key == 'content') {
                    $this->tpl->setVar('ARTICLE_'.strtoupper($key), substr($value, 0, 5));
                } else {
                    $this->tpl->setVar('ARTICLE_'.strtoupper($key), $value);
                }
            }
            $this->tpl->parse('article_list_block','article_list',true);
        }
    }
    public function showSingleArticle($template = '', $data)
    {
        // Zend_debug::dump($data);die;
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
        foreach($data[0] as $key => $value) {
            //echo 'ARTICLE_'.strtoupper($key)." - ".$value."<br>";
            $this->tpl->setVar('ARTICLE_'.strtoupper($key), $value);
        }
    }
    public function useTemplate($template = '')
    {
        if($template != '') {
            $this->template = $template;
        }
        $this->tpl->setFile('tpl_main','article/' . $this->template . ".tpl");
    }
}