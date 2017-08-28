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
.singlePost {
    height: 75px;
}

</style>
<script type="text/javascript">
    var siteUrl = "{SITE_URL}";
</script>
<div id="appendToThis">
    <!-- BEGIN article_list -->
    <div class="singlePost" style="display:inline-block; width: 100%; margin: 2px 0px;">
        <!-- <p><strong>{ARTICLE_ID}</strong></p> -->
        <a href="{SET_BY_TYPE}" style="font-size: 16px;"><strong>{ARTICLE_TITLE}</strong></a>
        <!-- BEGIN article_like_controls -->
        <div style='float: left; padding: 10px' id="likebox{ARTICLE_ID}">
            <img src='{SITE_URL}/images/frontend/up.png' style='{ARTICLE_LIKE_STYLE_UP}' value='like' on='{ARTICLE_LIKE_ON_UP}' id="like{ARTICLE_ID}" class='likeDislikeArt'>
            <span>{ARTICLE_LIKECOUNT}</span>
            <img src='{SITE_URL}/images/frontend/down.png' style='{ARTICLE_LIKE_STYLE_DOWN}' value='dislike' on='{ARTICLE_LIKE_ON_DOWN}' id="dislike{ARTICLE_ID}" class='likeDislikeArt'>
        </div>
        <br>
        <!-- END article_like_controls -->
        <div style="position: relative; margin: 7px 0px">
            <a href="{SITE_URL}/article/show_article_content/id/{ARTICLE_ID}"><span class="post">{ARTICLE_COMMENTCOUNT} comments</span></a>
            <span class="post"></span>
            <span class="post"></span>
        </div>
    </div>
    <hr>
    <!-- END article_list -->
</div>
<span id="scrollFromMe"></span>
<a href="{SITE_URL}/article/add"><span class="button">Add post</a>
<hr>
<p>LOADED POSTS: <span id="postCount">{POST_COUNT}</span></p>

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

            type: 'POST',
            data: toSend,
            success: function (ajaxResponse) {
                ajaxResponse = JSON.parse(ajaxResponse);

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

loadOnScroll();

function isScrolledIntoView(elem)
{
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop)) && elem.css( "display" ) != 'none';
}


function loadOnScroll(page)
{
    var page = 1;
    var win = $(window);
    win.scroll(function(e) {
        // setTimeout(function() {
            if(isScrolledIntoView($( "#scrollFromMe" ))) {
                loadMorePosts(page);
                $('#scrollFromMe').hide();
                page++;
            }
        // },500);
    });
}

function loadMorePosts(page)
{
    toSend = {
        'loadMore' : page
    };
    $.ajax({
        type: 'POST',
        data: toSend,
        success: function (ajaxResponse) {

            ajaxResponse = JSON.parse(ajaxResponse);
            page = ajaxResponse.count;
            var logged = ajaxResponse.logged;
            $("#postCount").text(parseInt($("#postCount").text())+ajaxResponse.articleData.length);
            $(ajaxResponse.articleData).each(function(index, post) {
                if(post.articleRating != 0) {
                    if(post.articleRating > 0) {
                        var styleUp = 'filter: grayscale(0);';
                        var styleDown = 'filter: grayscale(1);';
                        var likeOnUp = '1';
                        var likeOnDown = '0';
                    } else {
                        var styleUp = 'filter: grayscale(1);';
                        var styleDown = 'filter: grayscale(0);';
                        var likeOnUp = '0';
                        var likeOnDown = '1';
                    }
                } else {
                    var styleUp = 'filter: grayscale(1);';
                    var styleDown = 'filter: grayscale(1);';
                    var likeOnUp = '0';
                    var likeOnDown = '0';
                }
                var theUrl = '';
                if(post.type == 0) {
                    theUrl = "article/show_article_content/id/" + post.id;
                } else {
                    var ok = post.content.match(/http\:\/\//);
                    var pref = '';
                    if(ok == 0) {
                        pref = 'http://';
                    }
                    theUrl = pref+post.content;
                }
                var first = '<div class="singlePost" style="display:inline-block; width: 100%; margin: 2px 0px;"><a href="'+theUrl+'" style="font-size: 16px;"><strong>'+post.title+'</strong></a>';
                var second = '<div style="float: left; padding: 10px" id="likebox'+post.id+'"><img src="'+siteUrl+'/images/frontend/up.png" style="'+styleUp+'" value="like" on="'+likeOnUp+'" id="like'+post.id+'" class="likeDislikeArt"><span>'+post.likeCount+'</span><img src="'+siteUrl+'/images/frontend/down.png" style="'+styleDown+'" value="dislike" on="'+likeOnDown+'" id="dislike'+post.id+'" class="likeDislikeArt"></div><br>';
                var third = '<div style="position: relative; margin: 7px 0px"><a href="{SITE_URL}/article/show_article_content/id/'+post.id+'"><span class="post">'+post.commentCount+' comments</span></a><span class="post"></span><span class="post"></span></div></div><hr>';
                if(logged == 'true') {
                    $("#appendToThis").append(first+second+third);
                    $(document).on('click', '#like'+post.id, function() {
                        // alert(1);
                        var idsep = $(this).attr('id');
                        var returnedArray = idsep.match(/(.+?)(\d.+)/);
                        voteRequestArticle(returnedArray[1], returnedArray[2]);
                    });
                    $(document).on('click', '#dislike'+post.id, function() {
                        var idsep = $(this).attr('id');
                        var returnedArray = idsep.match(/(.+?)(\d.+)/);
                        voteRequestArticle(returnedArray[1], returnedArray[2]);
                    });
                } else {
                    $("#appendToThis").append(first+third);                    
                }
            });

            $('#scrollFromMe').show();
            if(jQuery.isEmptyObject(ajaxResponse.articleData) == true) {
                $(window).unbind('scroll');
                $('#scrollFromMe').remove();
            }
        }
    });
}
</script>