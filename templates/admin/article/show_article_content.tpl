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
<!-- BEGIN comment_display -->
<hr>
<div class="comment">
    <form method="POST">
        <textarea style="margin: 5px;" rows='3' cols='90' name="content"></textarea>
        <input style="margin: 5px;" type="submit" class="button">
    </form>
</div>
<!-- END comment_display -->