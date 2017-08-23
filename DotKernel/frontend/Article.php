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
	public function getAllArticleData($userId = '')
	{
		$select = $this->db->select()
						->from('article');
		// Zend_Debug::dump($this->db->fetchAll($select));die;
		$queriedList = $this->db->fetchAll($select);
		$finished = [];
		if($userId != '') {

			foreach($queriedList as $key => $inner) {
				$aux = $this->returnLikedArticlesByUserId($userId,$inner['id']);
				if(isset($aux[$inner['id']])) {
					$inner['articleRating'] = $aux[$inner['id']];
				} else {
					$inner['articleRating'] = 0;
				}
				$inner['likeCount'] = $this->countLikesDislikes(0,$inner['id']);
				$inner['commentCount'] = $this->getCommentCount((int)$inner['id']);
				$finished[$key] = $inner;
			}
		} else {
			foreach($queriedList as $key => $inner) {
				$inner['commentCount'] = $this->getCommentCount((int)$inner['id']);
				$finished[$key] = $inner;
			}
		}
		// Zend_Debug::dump($finished);die;
		return $finished;
	}
	public function getSingleArticleData($id)
	{
		$select = $this->db->select()
						->from('article')
						->where('id = ?', $id);
		return $this->db->fetchRow($select);
	}
	public function getCommentByArticleId($id)
	{
		$completedData = [];
		$comments = $this->getComments($id);

		foreach ($comments as $key => $value) {
			$replies = $this->getCommentReplytByCommentId($value['id']);
			$completedData[$value['id']]['content'] = $value['content'];
			$completedData[$value['id']]['userId'] = $value['userId'];
			$completedData[$value['id']]['username'] = $value['username'];
			$completedData[$value['id']]['likeCount'] = $this->countLikesDislikes($value['id']);

			if(isset($replies) && !empty($replies))
			{
				$completedData[$value['id']]['replies'] = $replies;
			}
		}

		return $completedData;
	}


	/**
	* get comments that have parent id 0
	*/
	public function getComments($id)
	{
		$defaultParentId = 0;
	    $select = $this->db->select()
	                    ->from('comment')
	                    ->where('postId = ?', $id)
	                    ->where('parent = ?', $defaultParentId)
	                    ->join('user','user.id = comment.userId','user.username');
	    $result = $this->db->fetchAll($select);
	    return $result;
	}

	public function getCommentCount($id)
	{
		$defaultParentId = 0;
	    $select = $this->db->select()
	                    // ->from('comment')
	                    ->from('comment', array('row_count' => 'COUNT(*)'))
	                    ->where('postId = ?', $id);
	    $result = $this->db->fetchOne($select);
	    
	    return $result;
	}
	/**
	* get comment reply by comment id
	*/
	public function getCommentReplytByCommentId($id)
	{
		$select = $this->db->select()
	                    ->from('comment',array('content','date','userId', 'id'))
	                    ->where('parent = ?', $id)
	                    ->join('user','user.id = comment.userId','username');
	    $result = $this->db->fetchAll($select);
	    $finished = [];
		foreach($result as $key => $inner) {
			$inner['likeCount'] = $this->countLikesDislikes((int)$inner['id']);
			$finished[$key] = $inner;
		}
	    return $finished;
	}

	public function deleteCommentById($id)
    {
        $data = [
        	'content' => '[deleted]',
        	'userId' => 0
        	];
        $this->db->update('comment', $data, 'id = ' . $id);
    }

    public function checkCommentPosterByCommentId($id)
    {
    	$select = $this->db->select()
						->from('comment')
						->where('id = ?', $id);

		$result = $this->db->fetchRow($select);

		return $result['userId'];
    }

    public function commentDatabaseWork($data, $id)
    {
    	$data = htmlentities($data);
        $myArray = ['content' => $data];
        if(isset($myArray['content']) && !empty($myArray['content'])) {
            $this->db->update('comment', $myArray, "id = " . $id);
        }
    }

    public function userIdToUsername($id)
    {
    	$select = $this->db->select()
	                    ->from('user',array('username'))
	                    ->where('id = ?', $id);
	    return $this->db->fetchOne($select);
    }

    public function returnLastCommentIdOfUserByUserId($id)
    {
    	$select = $this->db->select()
	                    ->from('comment', array(new Zend_Db_Expr('max(id) as maxId')))
	                    ->where('userId = ?', $id);
	    return $this->db->fetchOne($select);
    }

    public function addCommentToDatabase($data)
    {
    	$this->db->insert('comment', $data);
    }

    public function addNewPostToDatabase($data)
    {
    	$this->db->insert('article', $data);
    }

    public function countLikesDislikes($commentId, $articleId = '')
    {
    	if($commentId == 0 && $articleId != '') {
    		$select = $this->db->select()
		                    ->from('commentRating', array('row_count' => 'COUNT(*)'))
		                    ->where('articleId = ?', $articleId)
		                    ->where('postId = ?', 0)
		                    ->where('rating = ?', 1);
		    $upvote = $this->db->fetchOne($select);

		    $select = $this->db->select()
		                    ->from('commentRating', array('row_count' => 'COUNT(*)'))
		                    ->where('articleId = ?', $articleId)
		                    ->where('postId = ?', 0)
		                    ->where('rating = ?', -1);
		    $downvote = $this->db->fetchOne($select);

		    return $upvote - $downvote;
    	} else {
			$select = $this->db->select()
		                    // ->from('comment')
		                    ->from('commentRating', array('row_count' => 'COUNT(*)'))
		                    ->where('postId = ?', $commentId)
		                    ->where('rating = ?', 1);
		    $upvote = $this->db->fetchOne($select);

		    $select = $this->db->select()
		                    // ->from('comment')
		                    ->from('commentRating', array('row_count' => 'COUNT(*)'))
		                    ->where('postId = ?', $commentId)
		                    ->where('rating = ?', -1);
		    $downvote = $this->db->fetchOne($select);

		    return $upvote - $downvote;
		}
    }

    public function returnCommentsLikedByUserOnArticle($userId, $articleId)
    {
    	$select = $this->db->select()
	                    ->from('commentRating',array('id','postId','rating'))
	                    ->where('rating != ?', 0)
	                    ->where('userId = ?', $userId)
	                    ->where('articleId = ?', $articleId);
	    $return = $this->db->fetchAll($select);
	    $done = [];
	    foreach ($return as $separateStuff) {
	    	$done[$separateStuff['postId']] = $separateStuff['rating'] * $separateStuff['id'];
	    }

	    // Zend_Debug::dump($done);
	    return $done;
    }

    public function returnLikedArticlesByUserId($userId, $articleId)
    {
    	$select = $this->db->select()
	                    ->from('commentRating',array('id','articleId','rating'))
	                    ->where('rating != ?', 0)
	                    ->where('userId = ?', $userId)
	                    ->where('postId = ?', 0)
	                    ->where('articleId = ?', $articleId);
	    $return = $this->db->fetchAll($select);
	    $done = [];
	    
	    foreach ($return as $key => $separateStuff) {
	    	$done[$separateStuff['articleId']] = $separateStuff['rating'] * $separateStuff['id'];
	    }
		// Zend_Debug::dump($done);
	    return $done;
    }

    public function handleLikeDislikeRequests($action, $id, $state, $user, $articleId)
    {
    	$select = $this->db->select()
							->from('commentRating')
							->where('postId = ?', $id)
							->where('userId = ?', $user)
							->where('articleId = ?', $articleId);
		$exists = $this->db->fetchOne($select);
		if($exists != false) {
	    	if($state == 1) {
	    		switch($action) {
			        case 'like':
			        	$dataVar = [
				    		'rating' => 0
				    	];
				    	$this->db->update('commentRating', $dataVar, "id = " . $exists);
			            break;
			        case 'dislike':
			        	$dataVar = [
				    		'rating' => 0
				    	];
				    	$this->db->update('commentRating', $dataVar, "id = " . $exists);
			            break;
			    }
	    	} else if ($state == 0) {
	    		switch($action) {
			        case 'like':
			        	$dataVar = [
				    		'rating' => 1
				    	];
				    	$this->db->update('commentRating', $dataVar, "id = " . $exists);
			            break;
			        case 'dislike':
			        	$dataVar = [
				    		'rating' => -1
				    	];
				    	$this->db->update('commentRating', $dataVar, "id = " . $exists);
			            break;
			    }
	    	}
	    } else {
	    	if($state == 1) {
	    		switch($action) {
			        case 'like':
			        	$dataVar = [
			        		'postId' => $id,
				    		'userId' => $user,
				    		'rating' => 0,
				    		'articleId' => $articleId
				    	];
				    	$this->db->insert('commentRating', $dataVar);
			            break;
			        case 'dislike':
			        	$dataVar = [
			        		'postId' => $id,
				    		'userId' => $user,
				    		'rating' => 0,
				    		'articleId' => $articleId
				    	];
				    	$this->db->insert('commentRating', $dataVar);
			            break;
			    }
	    	} else if ($state == 0) {
	    		switch($action) {
			        case 'like':
			        	$dataVar = [
			        		'postId' => $id,
				    		'userId' => $user,
				    		'rating' => 1,
				    		'articleId' => $articleId
				    	];
				    	$this->db->insert('commentRating', $dataVar);
			            break;
			        case 'dislike':
			        	$dataVar = [
			        		'postId' => $id,
				    		'userId' => $user,
				    		'rating' => -1,
				    		'articleId' => $articleId
				    	];
				    	$this->db->insert('commentRating', $dataVar);
			            break;
			    }
	    	}
	    }
    }
}