<style>
span.post {
    position: absolute;
}
.likeDislikeArt {
    display: block;
    height: 14px;
    width: 14px;
    padding: 3px 0px;
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
<!-- BEGIN article_list -->
<div style="display:inline-block; width: 100%; margin: 2px 0px;">
    <!-- <p><strong>{ARTICLE_ID}</strong></p> -->
    <a href="{SET_BY_TYPE}" style="font-size: 16px;"><strong>{ARTICLE_TITLE}</strong></a>
    <!-- BEGIN comment_like_controls -->
    <div style='float: left; padding: 10px' id="likebox{ARTICLE_ID}">
        <img src='/CITit/images/frontend/up.png' style='{ARTICLE_LIKE_STYLE_UP}' value='like' on='{ARTICLE_LIKE_ON_UP}' id="like{ARTICLE_ID}" class='likeDislikeArt'>
        <span>{ARTICLE_LIKECOUNT}</span>
        <img src='/CITit/images/frontend/down.png' style='{ARTICLE_LIKE_STYLE_DOWN}' value='dislike' on='{ARTICLE_LIKE_ON_DOWN}' id="dislike{ARTICLE_ID}" class='likeDislikeArt'>
    </div>
    <br>
    <!-- END comment_like_controls -->
    <div style="position: relative; margin: 7px 0px">
        <a href="{SITE_URL}/article/show_article_content/id/{ARTICLE_ID}"><span class="post">{ARTICLE_COMMENTCOUNT} comments</span></a>
        <span class="post"></span>
        <span class="post"></span>
    </div>
    <!-- <p><strong>{ARTICLE_DATE}</strong></p> -->
    <!-- <a href="{SITE_URL}/article/show_article_content/id/{ARTICLE_ID}">GO TO ARTICLE</a> -->
</div>
<hr>
<!-- END article_list -->
<a href="{SITE_URL}/article/add"><span class="button">Add post</a>
<hr>
<p>TOTAL POSTS: {POST_COUNT}</p>

<script>
$(document).ready(function(){
    $('img.likeDislikeArt').click(function(e) {
        e.preventDefault();
        var idsep = $(this).attr('id');
        var returnedArray = idsep.match(/(.+?)(\d+)/);
        voteRequestArticle(returnedArray[1], returnedArray[2]);
    });
});

function voteRequestArticle(action, id, type = '')
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
</script>