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
		//$this->session = Zend_Registry::get('session');
	}
	/**
	 * Get user info
	 * @access public
	 * @param int $id
	 * @return array
	 */
	//get all data form data base
	public function getAllArticleData($page = 1)
	{
		$select = $this->db->select()
						->from('article')
						->order('article.view DESC');
		return $this->db->fetchAll($select);
// 	   $dotPaginator = new Dot_Paginator($select, $page, $this->settings->resultsPerPage);
// 		return $dotPaginator->getData();
	}
	/**
	 * get comments by given id
	* @access public
	* @param int $id
	* @return array comment
	*/
	public function getCommentById($id)
	{
	    $select = $this->db->select()
        	    ->from('comment')
        	    ->where('id = ?', $id);
	    $comment = $this->db->fetchRow($select);
	    return $comment;
	}
	
	//get singel article form data base
	public function getSingleArticleData($id)
	{
		$select = $this->db->select()
						->from('article')
						->where('id = ?', $id);
		return $this->db->fetchRow($select);
	}
	
	//get cooment by id form data base
	public function getCommentByArticleId($id)
	{
		$comepletedData = [];
		$comments = $this->getComments($id);
// 		Zend_Debug::dump($comments, $label=null, $echo=true);

		foreach ($comments as $key => $value) {
			$replies = $this->getCommentReplytByCommentId($value['id']);
			
			$comepletedData[$value['id']]['content'] = $value['content'];
			$comepletedData[$value['id']]['userId'] = $value['userId'];
			$comepletedData[$value['id']]['username'] = $value['username'];
			$comepletedData[$value['id']]['id'] = $value['id'];
			$comepletedData[$value['id']]['admin'] = $value['admin'];
			if(isset($replies) && !empty($replies))
			{
				$comepletedData[$value['id']]['replies'] = $replies;
			}
		}
		// Zend_Debug::dump($comments);exit;
		return $comepletedData;
	}
	/**
	* get comments that have parent id 0
	*/
	public function getComments($id)
	{
		$defaultParentId = 0;
	    $select = $this->db->select()
	                    ->from('comment',array('content','date','userId', 'id', 'admin'))
	                    ->where('postId = ?', $id)
	                    ->where('parent = ?', 0)
	                    ->joinLeft('user','user.id = comment.userId','username');
	    $result = $this->db->fetchAll($select);
	    
// 	    Zend_Debug::dump($result, $label=null, $echo=true);
	    
	    return $result;
	}
	/**
	 * get coment reply by coment id
	 */
	public function getCommentReplytByCommentId($id)
	{
	    $select = $this->db->select()
                	    ->from('comment',array('content','date','userId', 'id', 'admin'))
                	    ->where('parent = ?', $id)
                	    ->joinLeft('user','user.id = comment.userId','username');
	    $result = $this->db->fetchAll($select);
	    // 	    Zend_Debug::dump($result, $label=null, $echo=true);exit;
	    return $result;
	}
	

	public function getReply($id)
	{
	  $select = $this->db->select()
	                    ->from('comment')
	                    ->where('id = ?', $id);
	                    
	                    
	    $result = $this->db->fetchRow($select);
// 	    Zend_Debug::dump($result, $label=null, $echo=true);exit;
	    return $result;
	}

	// add a new article in database
	public function addArticle($data)
	{
		$insert=$this->db->insert('article',$data);
     
	}
	//add a new comment
	public function insertComment($comment)
	{
	    try
	    {
	        $this->db->insert('comment', $comment);
	        return true;
	    }
	    catch ( Exception $e )
	    {
	        return false;
	    }
	}
	//delete comment and replay
	public function deleteCommentAndReplay($id)
    {
        $delete=$this->db->delete('comment','id='.$id);

    } 
   
    /**
     * @access public
     * @param int $id
     * @param
     *        	array comment
     * @return bool $success
     */
    public function updateComment($id, $comment)
    {
        try
        {
            $this->db->update('comment', $comment, 'id=' . $id);
            return true;
        }
        catch ( Exception $e )
        {
            return false;
        }
    }
    
    //check poster comment by id
    public function checkCommentPosterByCommentId($id)
    {
    	$select = $this->db->select()
						->from('comment')
						->where('id = ?', $id);
		$result = $this->db->fetchRow($select);
		return $result['userId'];
    }
    // comment database work
    public function commentDatabaseWork($data, $id)
    {
    	$data = htmlentities($data);
        $myArray = ['content' => $data];
        if(isset($myArray['content']) && !empty($myArray['content'])) {
            $this->db->update('comment', $myArray, "id = " . $id);
        }
    }
    //
    public function userIdToUsername($id)
    {
    	$select = $this->db->select()
	                    ->from('user',array('username'))
	                    ->where('id = ?', $id);
	    return $this->db->fetchOne($select);
    }
	//
    public function returnLastCommentIdOfUserByUserId($id)
    {
    	$select = $this->db->select()
	                    ->from('comment', array(new Zend_Db_Expr('max(id) as maxId')))
	                    ->where('userId = ?', $id);
	    return $this->db->fetchOne($select);
    }
    //insert new comment in data base
    public function addCommentToDatabase($data)
    {
    	$this->db->insert('comment', $data);
    }
    // delete a article from database
    public function deleteArticle($id)
    {
    	try
		{
			$this->db->delete('article', 'id='.$id);
			return true;
		}
		catch (Exception $e)
		{
			return false;
		}
    }
    
    // delete comment
    public function deleteComment($id)
    {
        try
        {
            $this->db->delete('comment', 'id='.$id);
            return true;
        }
        catch (Exception $e)
        {
            return false;
        }
    }
    // delete reply
    public function deleteReply($id)
    {
        try
        {
            $this->db->delete('comment', 'id='.$id);
            return true;
        }
        catch (Exception $e)
        {
            return false;
        }
    }

    // select article after id
    public function getArticleById($id)
    {
        $select = $this->db->select()
                ->from('article')
                ->where('id = ?', $id);
        
        $result = $this->db->fetchRow($select);

        return $result;
    }
    
    // update a new article
    public function updateArticle($id, $data)
    {
        $update=$this->db->update('article',$data,'id='.$id);
    }

    public function likeOrDislike ($id, $rating)
    {
    	$select = $this->db->select()
    			->from ('commentRating')
    			->joinLeft('user','user.id = commentRating.userId')
    			->where('postId=0')
    			->where('articleId='.$id)
    			->where('rating ='.$rating);
    	$result=$this->db->fetchAll($select);

    	// Zend_Debug::dump($result, $label=null, $echo=true);exit();
    	return $result;

    }

    // public function orderByAscArticle()
    // {
        
    //     $select=$this->db->select()
    //     		-> from('article')
    //     		->orderby('article.view ASC');
    //     $result=$this->db->fetchAll($select);
    //     // Zend_Debug::dump($result);exit;
    //     return $select;

    // }

}