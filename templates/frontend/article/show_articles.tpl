<style>
span.post {
    position: absolute;
}
</style>
<!-- BEGIN article_list -->
<div style="display:inline-block; width: 100%;">
    <!-- <p><strong>{ARTICLE_ID}</strong></p> -->
    <a href="{SET_BY_TYPE}"><strong>{ARTICLE_TITLE}</strong></a>
    <div style="position: relative">
        <a href="{SITE_URL}/article/show_article_content/id/{ARTICLE_ID}"><span class="post">comments</span></a>
        <span class="post"></span>
        <span class="post"></span>
    </div>
    <!-- <p><strong>{ARTICLE_DATE}</strong></p> -->
    <!-- <a href="{SITE_URL}/article/show_article_content/id/{ARTICLE_ID}">GO TO ARTICLE</a> -->
</div>
<hr>
<!-- END article_list -->
<p>TOTAL POSTS: {POST_COUNT}</p>
