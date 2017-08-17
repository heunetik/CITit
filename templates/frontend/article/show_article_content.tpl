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
textarea {
    resize: none;
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
    <h2>{ARTICLE_TITLE}</h2>
    <hr>
    <p>{ARTICLE_CONTENT}</p>
    <span style="font-size: 12px; float: right">{ARTICLE_DATE}</span>
    <hr>
</div>
<!-- BEGIN comment_submit -->
<div>
    <div class="comment" style="display: inline-block; text-align: center; width:100%; overflow: hidden;">
        <textarea id="newComment" style="margin: 6px; float: left; position: relative; z-index:100; width:99%;" rows='3' cols='120' name="content"></textarea>
        <span style="display: none; padding: 5px;" center class="fadeThis success">Comment submitted!</span>
    </div>
    <button style="margin: 5px; float: right;" onclick="submitComment()" class="button">Submit</button>
</div>
<!-- END comment_submit -->
<hr>
    <h1>Comments:</h1>
<div id="commentDiv">
    <!-- BEGIN comment_display -->
    <div id="comment_{COMMENT_ID}">
        <hr size="10">
            <div id="append{COMMENT_ID}">
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

function submitComment()
{
    var commentData = {};
    var textareaValue = $("#newComment").val();
    // alert(textareaValue);
    commentData = {
                newComment: 1,
                parent : 0,
                content : textareaValue
        };
    $.ajax({
            type: 'POST',
            data: commentData,
            success: function (data) {
                data = JSON.parse(data);
                $("#commentDiv").prepend('<div id="comment_'+data.lastCommId+'"><hr size="10"><div id="append'+data.lastCommId+'"><div id="appendTo'+data.lastCommId+'"><strong class="'+data.lastCommId+'">'+data.username+' : </strong><br><span style="padding: 0px 20px;"  id="content'+data.lastCommId+'" class="'+data.lastCommId+'">'+data.content+'</span><!-- BEGIN comment_controls --><span><button id="edit'+data.lastCommId+'" onclick="editComment('+data.lastCommId+')">Edit</button><button id="delete'+data.lastCommId+'" onclick="deleteComment('+data.lastCommId+')">Delete</button></span><span id="save'+data.lastCommId+'"></span><!-- END comment_controls --><!-- BEGIN comment_replyToComment --><div id="appendReplyTo'+data.lastCommId+'" style="display: inline-block"><button id="reply'+data.lastCommId+'" onclick="replyToCommentById('+data.lastCommId+')">Reply</button></div><!-- END comment_replyToComment --></div><br><hr>');
                fadeStuffByProperty("#content"+data.lastCommId,"green");
                // $(".fadeThis").css("display","block");
                $("#newComment").val("");
                // $(".fadeThis").show();
                $(".fadeThis").css('display','block');
                $(".fadeThis").fadeOut(3200);
            }
        });
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
                fadeStuffByProperty("#content"+id,"yellow");
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
                data = JSON.parse(data);
                // alert(data.parent);
                $(".textarea"+id).replaceWith(function() {
                    return '<span style="padding: 5px" class="fadeThis'+data.lastCommId+' success">Comment submitted!</span>';
                });
                // $("#append"+data.parent).append("hello");
                $("#append"+data.parent).append('<div style="padding-left: 3%; margin: 7px"><strong>-</strong><strong class="'+data.lastCommId+'">'+data.username+' : </strong><span style="padding: 0px 20px;" class="'+data.lastCommId+'" id="content'+data.lastCommId+'">'+data.content+'</span><!-- BEGIN reply_controls --><span><span><button id="edit'+data.lastCommId+'" onclick="editComment('+data.lastCommId+')">Edit</button><button id="delete'+data.lastCommId+'" onclick="deleteComment('+data.lastCommId+')">Delete</button></span><!-- END reply_controls --><br><span id="save'+data.lastCommId+'"></span></div>');
                fadeStuffByProperty("."+data.lastCommId, "green");
                $(".fadeThis"+data.lastCommId).fadeOut(3200);
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
}

function fadeStuffByProperty(property, color)
{
    var h,s,l;

    switch(color) {
        default:
            h = 92;
            s = 72;
            l = 75;
            break;
        case "green":
            h = 92;
            s = 72;
            l = 75;
            break;
        case "yellow":
            h = 48;
            s = 97;
            l = 85;
            break;
    }

    $(property).parent().css('background-color','hsl('+h+', '+s+'%, '+l+'%)');

    var d = 1000;
    for(var i=l; i<=100; i=i+0.6){
        d  += 10;
        (function(ii,dd){
            setTimeout(function(){
                $(property).parent().css('backgroundColor','hsl('+h+', '+s+'%,'+ii+'%)'); 
            }, dd);    
        })(i,d);
    }
}
</script>