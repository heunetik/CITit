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
 * @category   Apidemia Internship 2017
 * @package    CITit
 * @author     Szabo Akos <szabo.aks@gmail.com>
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

	// Gets all article data, also gets the LIKE DATA if the user is logged in.
	// The startFrom variable is only a counter for the infinity scroll
	public function getAllArticleData($userId = '', $startFrom = 0)
	{
		$select = $this->db->select()
						->from('article')
						->limit(10, $startFrom);
		$queriedList = $this->db->fetchAll($select);
		$finished = [];
		if($userId != '') {

			foreach($queriedList as $key => $inner) {
				$aux = $this->returnLikedArticlesByUserId($userId,$inner['id']);
				// if the logged user liked an article,
				// the like data will be appended to the article data
				if(isset($aux[$inner['id']])) {
					$inner['articleRating'] = $aux[$inner['id']];
				} else {
					$inner['articleRating'] = 0;
				}
				$inner['likeCount'] = $this->countLikesDislikes(0,$inner['id']);
				$inner['commentCount'] = $this->getCommentCount((int)$inner['id']);
				// we save the newly concatenated data in a new array to return
				$finished[$key] = $inner;
			}
		} else {
			// if the user is not logged in, just return the data from the DB without
			// adding anything
			foreach($queriedList as $key => $inner) {
				$inner['commentCount'] = $this->getCommentCount((int)$inner['id']);
				// we put all of the data in the finished array, but we don't change anything
				$finished[$key] = $inner;
			}
		}
		return $finished;
	}

	// gets all the data from an article by it's ID
	public function getSingleArticleData($id)
	{
		$select = $this->db->select()
						->from('article')
						->where('id = ?', $id);
		return $this->db->fetchRow($select);
	}

	// Separates comments from replies
	// Adds replies to it's parent with an array
	// concatenated to the comment data
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

			if(isset($replies) && !empty($replies)) {
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

	// Returns the comment ammount on the article with the $id
	public function getCommentCount($id)
	{
		$defaultParentId = 0;
	    $select = $this->db->select()
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
	    // we append the like count to every reply
		foreach($result as $key => $inner) {
			$inner['likeCount'] = $this->countLikesDislikes((int)$inner['id']);
			$finished[$key] = $inner;
		}
	    return $finished;
	}

	// we "delete" the comment by replacing the content with
	// [deleted] and we change the userId to one created by us
	// with the 0 id, named [deleted]
	public function deleteCommentById($id)
    {
        $data = [
        	'content' => '[deleted]',
        	'userId' => 0
        	];
        $this->db->update('comment', $data, 'id = ' . $id);
    }

    // We check if the logged in user is the
    // author of any comments
    // (used for editing/deleting by the user)
    public function checkCommentPosterByCommentId($id)
    {
    	$select = $this->db->select()
						->from('comment')
						->where('id = ?', $id);

		$result = $this->db->fetchRow($select);

		return $result['userId'];
    }

    // we update the edited comment data in the database
    public function commentDatabaseWork($data, $id)
    {
    	$data = htmlentities($data);
        $myArray = ['content' => $data];
        if(isset($myArray['content']) && !empty($myArray['content'])) {
            $this->db->update('comment', $myArray, "id = " . $id);
        }
    }

    // we return the user's username by it's userId
    public function userIdToUsername($id)
    {
    	$select = $this->db->select()
	                    ->from('user',array('username'))
	                    ->where('id = ?', $id);
	    return $this->db->fetchOne($select);
    }

    // The function returns the last comment/reply posted
    // by the user with the userId $id
    // This is used for editing newly posted comments/replies,
    // to avoid editing other users' comments/repliess
    public function returnLastCommentIdOfUserByUserId($id)
    {
    	$select = $this->db->select()
	                    ->from('comment', array(new Zend_Db_Expr('max(id) as maxId')))
	                    ->where('userId = ?', $id);
	    return $this->db->fetchOne($select);
    }

    // Adds a newly posted comment to the database
    public function addCommentToDatabase($data)
    {
    	$this->db->insert('comment', $data);
    }

    // Adds a newly posted article to the database
    public function addNewPostToDatabase($data)
    {
    	$this->db->insert('article', $data);
    }

    // if commentId is zero and the articleId is set,
    // that means that we count the likes on an article
    //
    // if the commentId and the articleId are both set
    // means that we are counting the likes on a comment/reply
    //
    // we count the likes and the dislikes, and we return the
    // difference between the two
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
		                    ->from('commentRating', array('row_count' => 'COUNT(*)'))
		                    ->where('postId = ?', $commentId)
		                    ->where('rating = ?', 1);
		    $upvote = $this->db->fetchOne($select);

		    $select = $this->db->select()
		                    ->from('commentRating', array('row_count' => 'COUNT(*)'))
		                    ->where('postId = ?', $commentId)
		                    ->where('rating = ?', -1);
		    $downvote = $this->db->fetchOne($select);

		    return $upvote - $downvote;
		}
    }

    // returns all the comments liked by the user on the article
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

	    return $done;
    }

    // returns all the articles liked by the user on the article
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

	    return $done;
    }

    // $action - like/dislike
    // $id - The ID of the comment/reply/article
    // $state - Was it liked/disliked before
    // $user - The userId of the user which made the action
    // $articleId - The article which got liked || on which a comment/reply got liked
    //
    // We check if the user already liked/disliked the post (post = article/comment/reply)
    // if the select returns a value, that means we already have an action on the post
    // by the user, so we only need to update it
    //
    // Next, we check the state of the action.
    // If the post already has a like/dislike, unliking/undisliking will reset it's rating to 0
    // (As seen by at # PART1 #)
    // If the post has no like/dislike yet, or the action is the opposite of the current state
    // (ex: the post is liked, and it gets a dislike), that means we update straight to -1, skipping
    // the part where we set the rating to 0
    // (As seen by at # PART2 #)
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
	    		//# PART1 #
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
	    		//# PART2 #
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