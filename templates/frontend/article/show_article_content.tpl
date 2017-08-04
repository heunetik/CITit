<style>
.comment {
    /*display: inline-block;*/
    border: solid 2px black;
    border-radius: 5px;
    margin: 5px;
}
</style>
<div style="font-size: 16px">
    <p>CONTENT : {ARTICLE_CONTENT}</p>
    <p>Created on : {ARTICLE_DATE}</p>
    <p>Article ID : {ARTICLE_ID}</p>
</div>
<div class="comment">
    <form method="POST">
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
                <div>
                    <strong>{COMMENT_USERID}</strong>
                    <br>
                    {COMMENT_CONTENT}
                    <span style="float: right"><button class="button" onclick="deleteComment({COMMENT_ID})">Delete</button></span>
                </div>
                <br>
                replies:
                <br>
                <!-- BEGIN comment_reply -->
                    <div style="padding-left: 3%">
                        <strong>-{REPLY_USERNAME}</strong>
                        <br>
                        {REPLY_CONTENT}
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
        // var commentData = [id, textareaValue];
        console.log(commentData);
        $.ajax({
            type: 'POST',
            data: commentData,
            success: function (data) {
            }
        });
        $("#comment_"+id).remove();
    }
}
</script>