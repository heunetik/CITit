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
.likeDislikeComm {
    display: block;
    height: 14px;
    width: 14px;
    padding: 3px 0px;
}
.likeDislikeRep {
    display: block;
    height: 10px;
    width: 10px;
    padding: 3px 0px;
    margin-right: 10px;
    -webkit-filter: grayscale(1); /* Safari 6.0 - 9.0 */
    filter: grayscale(1);
}
.wrap {
  display: flex;
  align-items: baseline;
}
.leftD {
  flex: 0 0 5%;
}
.rightD {
  flex: 1;
}
</style>
<script type="text/javascript">
    var siteUrl = "{SITE_URL}";
</script>
<div style="font-size: 16px">
    <h2 class="post">{ARTICLE_TITLE}</h2>
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
    <h1 class="post">Comments:</h1>
<div id="commentDiv">
    <!-- BEGIN comment_display -->
    <div id="comment_{COMMENT_ID}">
        <hr size="10">
            <div id="append{COMMENT_ID}">
                <div id="appendTo{COMMENT_ID}">
                    <!-- BEGIN comment_like_controls -->
                    <div style='float: left; padding: 10px' id="likebox{COMMENT_ID}">
                        <img src='{SITE_URL}/images/frontend/up.png' style='{COMMENT_LIKE_STYLE_UP}' value='like' on='{COMMENT_LIKE_ON_UP}' id="like{COMMENT_ID}" class='likeDislikeComm'>
                        <span>{COMMENT_LIKE_COUNT}</span>
                        <img src='{SITE_URL}/images/frontend/down.png' style='{COMMENT_LIKE_STYLE_DOWN}' value='dislike' on='{COMMENT_LIKE_ON_DOWN}' id="dislike{COMMENT_ID}" class='likeDislikeComm'>
                    </div>
                    <br>
                    <!-- END comment_like_controls -->
                    <strong class="{COMMENT_ID}">{COMMENT_USERID} : </strong>
                    <br>
                    <span style="padding: 0px 20px;"  id="content{COMMENT_ID}" class="{COMMENT_ID}">{COMMENT_CONTENT}</span>
                    <!-- BEGIN comment_controls -->
                    <span>
                        <button id="edit{COMMENT_ID}" onclick="editComment({COMMENT_ID})">Edit</button>
                        <button id="delete{COMMENT_ID}" onclick="deleteComment({COMMENT_ID})">Delete</button>
                    </span>
                    <br>
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
                    <div class='wrap' style="padding-left: 3%; margin: 7px">
                        <!-- BEGIN reply_like_controls -->
                        <br>
                        <div class='leftD' id="likebox{REPLY_ID}">
                            <img src='{SITE_URL}/images/frontend/up.png' style='{REPLY_LIKE_STYLE_UP}' value='like' on='{REPLY_LIKE_ON_UP}' id="like{REPLY_ID}reply" class='likeDislikeRep'>
                            <span>{REPLY_LIKE_COUNT}</span>
                            <img src='{SITE_URL}/images/frontend/down.png' style='{REPLY_LIKE_STYLE_DOWN}' value='like' on='{REPLY_LIKE_ON_DOWN}' id="dislike{REPLY_ID}reply" class='likeDislikeRep'>
                        </div>
                        <br>
                        <!-- END reply_like_controls -->
                        <div class='rightD'>
                            <strong class="{REPLY_ID}">- {REPLY_USERNAME} : </strong>
                            
                            <span style="padding: 0px 20px;" class="{REPLY_ID}" id="content{REPLY_ID}">{REPLY_CONTENT}</span>
                            <!-- BEGIN reply_controls -->
                            <span>
                            <span>
                                <button id="edit{REPLY_ID}" onclick="editComment({REPLY_ID})">Edit</button>
                                <button id="delete{REPLY_ID}" onclick="deleteComment({REPLY_ID})">Delete</button>
                            </span>
                            <br>
                            <span id="save{REPLY_ID}"></span>
                            <!-- END reply_controls -->
                        </div>
                    </div>
                <!-- END comment_reply -->
            </div>
        <hr>
    </div>
    <!-- END comment_display -->
</div>
<script>
$(document).ready(function(){
    $('img.likeDislikeComm').click(function(e) {
        e.preventDefault();
        // alert($(this).attr('value'));
        // alert($(this).attr('id'));
        var idsep = $(this).attr('id');
        var returnedArray = idsep.match(/(.+?)(\d.+)/);
        voteRequest(returnedArray[1], returnedArray[2]);
    });
    $('img.likeDislikeRep').click(function(e) {
        e.preventDefault();
        // alert($(this).attr('value'));
        // alert($(this).attr('id'));
        var idsep = $(this).attr('id');
        var returnedArray = idsep.match(/(.+?)(\d.+?)(\D.+)/);
        voteRequest(returnedArray[1], returnedArray[2], returnedArray[3]);
    });
});

function voteRequest(action, id, type = '')
{

    var opposite = '';
    var onOff = $('#' + action + id + type).attr('on');

    if (action == 'like') {
        opposite = 'dislike';
    } else {
        opposite = 'like';        
    }

    if (action == 'like' || action == 'dislike') {
        toSend = {
            'action' : action,
            'id' : id,
            'state' : onOff
        };
        $.ajax({
            // url: voteRequestUrl,
            type: 'POST',
            data: toSend,
            success: function (ajaxResponse) {
                ajaxResponse = JSON.parse(ajaxResponse);
                // alert(ajaxResponse.newLikeNumber);
                $( "div#likebox" + id + " > span" ).html(ajaxResponse.newLikeNumber);
                id = id + type;
                if($('#' + action + id).css('filter') == 'grayscale(1)') {
                    if($('#' + opposite + id).css('filter') == 'grayscale(1)') {
                        $('#' + action + id).css('filter','grayscale(0)');
                        $('#' + action + id).attr('on','1');
                    } else {
                        $('#' + action + id).css('filter','grayscale(0)');
                        $('#' + action + id).attr('on','1');
                        $('#' + opposite + id).css('filter','grayscale(1)');
                        $('#' + opposite + id).attr('on','0');
                    }
                } else {
                    $('#' + action + id).css('filter','grayscale(1)');
                    $('#' + action + id).attr('on','0');
                }
            }
        });
    } else {
        alert(action);
    }
}

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
    var x = $("#content"+id).text();
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
                $("#commentDiv").prepend('<div id="comment_'+data.lastCommId+'"><hr size="10"><div id="append'+data.lastCommId+'"><div id="appendTo'+data.lastCommId+'"><!-- BEGIN comment_like_controls --><div style="float: left; padding: 10px" id="likebox'+data.lastCommId+'"><img src="'+siteUrl+'/images/frontend/up.png" style="filter: grayscale(1)" value="like" on="0" id="like'+data.lastCommId+'" class="likeDislikeComm"><span>0</span><img src="'+siteUrl+'/images/frontend/down.png" style="filter: grayscale(1)" value="dislike" on="0" id="dislike'+data.lastCommId+'" class="likeDislikeComm"></div><br><!-- END comment_like_controls --><strong class="'+data.lastCommId+'">'+data.username+' : </strong><br><span style="padding: 0px 20px;"  id="content'+data.lastCommId+'" class="'+data.lastCommId+'">'+data.content+'</span><!-- BEGIN comment_controls --><span><button id="edit'+data.lastCommId+'" onclick="editComment('+data.lastCommId+')">Edit</button><button id="delete'+data.lastCommId+'" onclick="deleteComment('+data.lastCommId+')">Delete</button></span><br><span id="save'+data.lastCommId+'"></span><!-- END comment_controls --><!-- BEGIN comment_replyToComment --><div id="appendReplyTo'+data.lastCommId+'" style="display: inline-block"><button id="reply'+data.lastCommId+'" onclick="replyToCommentById('+data.lastCommId+')">Reply</button></div><!-- END comment_replyToComment --></div><br>replies:<br></div></div>');
                $(document).on('click', '#like'+data.lastCommId, function() {
                    var idsep = $(this).attr('id');
                    var returnedArray = idsep.match(/(.+?)(\d.+)/);
                    voteRequest(returnedArray[1], returnedArray[2]);
                });
                $(document).on('click', '#dislike'+data.lastCommId, function() {
                    var idsep = $(this).attr('id');
                    var returnedArray = idsep.match(/(.+?)(\d.+)/);
                    voteRequest(returnedArray[1], returnedArray[2]);
                });
                fadeStuffByProperty("#content"+data.lastCommId,"green");
                $("#newComment").val("");
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
                $(".textarea"+id).replaceWith(function() {
                    return '<span style="padding: 5px" class="fadeThis'+data.lastCommId+' success">Comment submitted!</span>';
                });
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