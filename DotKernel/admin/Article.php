<?php
/**
 * DotBoost Technologies Inc.
 * DotKernel Application Framework
 *
 * @category   DotKernel
 * @copyright  Copyright (c) 2009-2015 DotBoost Technologies Inc. (http://www.dotboost.com)
 * @license    http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * @version    $Id: User.php 981 2015-06-11 13:51:41Z gabi $
 */

/**
 * User Model
 * Here are all the actions related to the user
 * @category   DotKernel
 * @package    Frontend
 * @author     DotKernel Team <team@dotkernel.com>
 */

class Article extends Dot_Model_User
{
	
	private $_userAgent;
	private $_httpReferer;
	
	/**
	 * Constructor
	 * @access public
	 */
	public function __construct($userAgent = null, $httpReferer=null)
	{
		parent::__construct();
		// if no userAgent is given on function call mark it as empty - if the userAgent is empty keep it empty
		// if the userAgent stays empty it can be used for robot detecting or devices with blank UA (usually bots)
		// HTTP Reffer is optional so mark it empty if there is no HTTP Reffer
		$this->_userAgent = (!is_null($userAgent)) ? $userAgent : '';
		$this->_httpReferer = (!is_null($httpReferer)) ? $httpReferer : '';
	}

	/**
	 * Get user info
	 * @access public
	 * @param int $id
	 * @return array
	 */
	public function getArticleList($page)
	{
		$select = $this->db->select()
						->from('article');
						// ->where('id = ?', $id);
		// return $this->db->fetchAll($select);
		// Zend_Debug::dump($this->settings->resultsPerPage);exit;
		$dotPaginator = new Dot_Paginator($select, $page, $this->settings->resultsPerPage);
		return $dotPaginator->getData();
	}
	public function getSingleArticleData($id)
	{
		$select = $this->db->select()
						->from('article')
						->where('id = ?', $id);
		return $this->db->fetchRow($select);
	}
	public function getArticleById($id)
    {
        $select = $this->db->select()
                        ->from('article')
                        ->where('id = ?', $id);
        $result = $this->db->fetchAll($select);
        Zend_Debug::dump($result, $label = null, $ECHO = false);

        return $result;
    }
	public function addArticleToDatabase($data, $id = "")
	{
		// $select = $this->db->insert('article', $data);
        if($id != "") {
            $select = $this->db->update('article', $data, "id = " . $id);
        } else {
            $select = $this->db->insert('article', $data);
        }
	}
	public function deleteArticleById($id)
    {
        $select = $this->db->delete('article', "id = " . $id);
        // return $select;
    }
}