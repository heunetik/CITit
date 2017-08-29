<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<div id="adminList" class="box-shadow">
    <table class="big_table" frame="box" rules="all">
   	 <thead>
   		 <tr>
   			 <th style="text-align: center; width: 20px;">#</th>
   			 <th><span>Content</span></th>
   			 <th><span>Date</span></th>
   			 <th width="230px">Action</th>
             <th>Like/Dislike</th>
   		</tr>
   	 </thead>
   	 <tbody>
		<!-- BEGIN article_list -->
   		 <tr>
   			 <td style="text-align: center;">{ARTICLE_ID}</td>
   			 <td>{ARTICLE_CONTENT}</td>
   			 <td>{ARTICLE_DATE}</td>
   			 <td>
				<table  class="action_table">
    				<tr>
        				<td width="50%"><a href="{SITE_URL}/admin/article/edit_article/id/{ARTICLE_ID}" title="Edit/Update" class="edit_state">Edit</a></td>
        				<td width="50%"><a href="{SITE_URL}/admin/article/delete_article/id/{ARTICLE_ID}" title="Delete" class="delete_state">Delete</a></td>
    				</tr>
				</table>
			</td>
            <td>
                <table  class="like_dislike_table">
                    <tr>
                        <td width="50%"><a href="{SITE_URL}/admin/article/like/id/{ARTICLE_ID}" title="Like" class="like">Like </a></td>
                        <td width="50%"><a href="{SITE_URL}/admin/article/dislike/id/{ARTICLE_ID}" title="Dislike" class="dislike">Dislike </a></td>
                    </tr>
                </table>
            </td>

   		 </tr>
		<!-- END article_list -->
   	 </tbody>
    </table>
</div>

<div class="comment">
        <input type="text" name="id" value="{ARTICLE_ID}" hidden="true">
        <textarea style="margin: 5px;" rows='3' cols='90' name="content" form="usrform"></textarea>
        <form action="{SITE_URL}/admin/article/comment/id/{ARTICLE_ID}" method="POST" id="usrform">
			  <input style="margin: 5px;" type="submit" value='Comment' class="button">
		</form>
</div>
<hr>
    <h1>Comments:</h1>
<div>

<div class="comment">
	<div class="comment_author">

	</div>
</div>


    <!-- BEGIN comment_display -->
    <div id="comment_{COMMENT_ID}">
        <hr size="10">
            <div>
                <div id="appendTo{COMMENT_ID}">
                    <strong class="{COMMENT_ID}">{COMMENT_USERID} : </strong>
                    <br>
                    <span style="padding: 0px 20px;"  id="content{COMMENT_ID}" class="{COMMENT_ID}">{COMMENT_CONTENT}</span>
                    <!-- BEGIN comment_controls -->
                    <div class="comments_buttons">
<!--                    <button id="edit{COMMENT_ID}" onclick="editComment({COMMENT_ID})">Edit</button> -->
						<a href = "{SITE_URL}/admin/article/edit_comment/id/{COMMENT_ID}/">Edit</a>
<!--                        <button id="delete{COMMENT_ID}" onclick="deleteComment({COMMENT_ID})">Delete</button> -->
						<a href = "{SITE_URL}/admin/article/delete_comment/id/{COMMENT_ID}/">Delete</a>

				       		<form action="{SITE_URL}/admin/article/reply/id/{COMMENT_ID}" method="POST" >
					       		<textarea style="margin: 5px;" rows='3' cols='90' name="content_reply"></textarea>
					       		<input type="hidden" value="{COMMENT_ID}" name="parent"/>
								<input type="submit" value='Reply' class="button"/>
							</form>

                    </div>
                    <span id="save{COMMENT_ID}"></span>
                    <!-- END comment_controls -->
                </div>
                <br>
                replies:
                <br>
                <!-- BEGIN comment_reply -->
                    <div style="padding-left: 3%; margin: 7px">
                        <strong>-</strong>
                        <strong class="{REPLY_ID}">{REPLY_USERNAME} : </strong>
                        <span style="padding: 0px 20px;" class="{REPLY_ID}" id="content{REPLY_ID}">{REPLY_CONTENT}</span>
                        <!-- BEGIN reply_controls -->
                        <div class="reply_buttons">

                        	<a href = "{SITE_URL}/admin/article/edit_reply/id/{REPLY_ID}/">Edit</a>
							<a href = "{SITE_URL}/admin/article/delete_reply/id/{REPLY_ID}/">Delete</a>
                        </div>
  <!--                       <span>
                            <button id="edit{REPLY_ID}" onclick="editComment({REPLY_ID})">Edit</button>
                            <button id="delete{REPLY_ID}" onclick="deleteComment({REPLY_ID})">Delete</button>
                        </span>
 -->
                        <!-- END reply_controls -->
                        <br>
                        <span id="save{REPLY_ID}"></span>
                    </div>
                <!-- END comment_reply -->
            </div>
        <hr>
    </div>
    <!-- END comment_display -->
</div>

{PAGINATION}
<script>


var siteUrl = "{SITE_URL}";


function deleteComment(commentId, commentRoot)
{

	$.ajax({
			url: siteUrl + '/cloud/delete-comment',
			type:"POST",
			dataType:"JSON",
			data: {commentId: commentId,commentRoot: commentRoot},
			succes: function (){



			}
	});
	/*dupa ce dai delete la comment tre sa stearga si commentul si reply-urile, face asta dar nu e dinamic,trebe dat refresh fortat*/
	/*$('.comment_'+commentId).fadeOut();commentul dispare,dar reply uri nu*/
	/*$('.replyDiv_'+commentId+'_'+commentRoot).fadeOut();*/
location.reload();

}

function editComment(id)
{
    var x = $("#content"+id).html();
    $("#content"+id).replaceWith(function() {
        return "<textarea class='textarea"+id+"' rows='2' cols='100'>" + $(this).val() + '</textarea>';
    });
    $(".textarea"+id).html(x);
    $("#edit"+id).hide();
    $("#delete"+id).hide();
    $('#save'+id).append("<button id = 'save_button_"+id+"' onclick='saveComment("+id+")'>Save</button>");
}
function saveComment(id)
{
    var commentData = {};
    var textareaValue = $(".textarea"+id).val();
    commentData = {
            id : id,
            content : textareaValue
    };
    $.ajax({
        type: 'POST',
        data: commentData,
        success: function (data) {
            $(".textarea"+id).replaceWith(function() {
                return '<span style="padding: 0px 20px;" id="content'+id+'">' + $(this).val() + '</div>';
            });
            $("#edit"+id).show();
            $("#delete"+id).show();
            $("#save_button_"+id).remove();
        }
    });
}
</script>

