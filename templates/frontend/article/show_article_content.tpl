<style>
.comment {
    /*display: inline-block;*/
    border: solid 2px black;
    border-radius: 5px;
    margin: 5px;
}
span {
    display: inline-flex;
}
.success {
    color: #4F8A10;
    background-color: #DFF2BF;
    border-radius:.5em;
    border: 1px solid;
    box-shadow:1px 1px 3px #888;
}
</style>
<div style="font-size: 16px">
    <p>CONTENT : {ARTICLE_CONTENT}</p>
    <p>Created on : {ARTICLE_DATE}</p>
    <p>Article ID : {ARTICLE_ID}</p>
</div>
<div class="comment">
    <form method="POST">
        <input type="hidden" name="newComment" />
        <input type="hidden" name="parent" value="0" />
        <textarea style="margin: 5px;" rows='3' cols='90' name="content"></textarea>
        <input style="margin: 5px;" type="submit" class="button">
    </form>
</div>
<hr>
    <h1>Comments:</h1>
<div>
    <!-- BEGIN comment_display -->
    <div id="comment_{COMMENT_ID}">
        <hr size="10">
            <div>
                <div id="appendTo{COMMENT_ID}">
                    <strong class="{COMMENT_ID}">{COMMENT_USERID} : </strong>
                    <br>
                    <span style="padding: 0px 20px;"  id="content{COMMENT_ID}" class="{COMMENT_ID}">{COMMENT_CONTENT}</span>
                    <!-- BEGIN comment_controls -->
                    <span>
                        <button id="edit{COMMENT_ID}" onclick="editComment({COMMENT_ID})">Edit</button>
                        <button id="delete{COMMENT_ID}" onclick="deleteComment({COMMENT_ID})">Delete</button>
                    </span>
                    <span id="save{COMMENT_ID}"></span>
                    <!-- END comment_controls -->
                    <!-- BEGIN comment_replyToComment -->
                    <div id="appendReplyTo{COMMENT_ID}" style="display: inline-block">
                        <button id="reply{COMMENT_ID}" onclick="replyToCommentById({COMMENT_ID})">Reply</button>
                    </div>
                    <!-- END comment_replyToComment -->
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
                        <span>
                        <span>
                            <button id="edit{REPLY_ID}" onclick="editComment({REPLY_ID})">Edit</button>
                        <button id="delete{REPLY_ID}" onclick="deleteComment({REPLY_ID})">Delete</button>
                        </span>
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
<script>
function deleteComment(id)
{
    if (confirm("Are you sure you want to delete the comment?")) {

        var commentData = {};

        commentData = {
                id : id,
                delete : 1
        };

        console.log(commentData);
        $.ajax({
            type: 'POST',
            data: commentData,
            success: function (stuff) {

                var myData = JSON.parse(stuff);

                $("."+id).hide().html(myData.content).fadeIn('fast');
            }
        });

        $("#edit"+id).remove();
        $("#delete"+id).remove();
    }
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
    $("#reply"+id).hide();

    $('#save'+id).append("<button id = 'save_button_"+id+"' onclick='saveComment("+id+")'>Save</button>");
}

function saveComment(id, mode = 0)
{
    var commentData = {};
    var textareaValue = $(".textarea"+id).val();
    if(mode == 0) {
        commentData = {
                edit: 1,
                id : id,
                content : textareaValue
        };

        $.ajax({
            type: 'POST',
            data: commentData,
            success: function (data) {
                $(".textarea"+id).replaceWith(function() {
                    return '<span style="padding: 0px 20px;" id="content'+id+'">' + $(this).val() + '</span>';
                });
                $("#edit"+id).show();
                $("#delete"+id).show();
                $("#reply"+id).show();
                $("#save_button_"+id).remove();
            }
        });
    } else if(mode == 1) {
        commentData = {
                newComment: 1,
                parent : id,
                content : textareaValue
        };

        $.ajax({
            type: 'POST',
            data: commentData,
            success: function (data) {
                $(".textarea"+id).replaceWith(function() {
                    return '<span style="padding: 5px" class="fadeThis success">Comment submitted!</span>';
                });
                $(".fadeThis").fadeOut(3200);
                $("#reply"+id).show();
                $("#edit"+id).show();
                $("#delete"+id).show();
                $("#save_button_"+id).remove();
            }
        });
    }
}
function replyToCommentById(id)
{
    $('#appendReplyTo'+id).append("<textarea class='textarea"+id+"' rows='2' cols='100' placeholder='Reply to comment'></textarea>");
    $("#reply"+id).hide();
    $("#edit"+id).hide();
    $("#delete"+id).hide();
    $('#appendReplyTo'+id).append("<button id = 'save_button_"+id+"' onclick='saveComment("+id+", 1)'>Save</button>");
    // var commentData = {};
    // var textareaValue = $(".textarea"+id).val();

    // commentData = {
    //         edit: 1,
    //         id : id,
    //         content : textareaValue
    // };

    // $.ajax({
    //     type: 'POST',
    //     data: commentData,
    //     success: function (data) {
    //         $(".textarea"+id).replaceWith(function() {
    //             return '<span style="padding: 0px 20px;" id="content'+id+'">' + $(this).val() + '</div>';
    //         });
    //         $("#edit"+id).show();
    //         $("#delete"+id).show();
    //         $("#save_button_"+id).remove();
    //     }
    // });
}
</script>