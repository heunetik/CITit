<h1 style="font-size: 48px">Edit Article: {ARTICLE_CONTENT}</h1>
<br>
<div>
    <form method="POST">
    <!-- action ="{SITE_URL}/admin/article/edit_article/id/{ARTICLE_ID}" -->
<!--    	<input type="hidden" name="id" value="{ARTICLE_ID}"/> --> 
        <div>
            <h2>Content:</h2>
            <textarea rows="12" cols="80" name="content">{ARTICLE_CONTENT}</textarea>
        </div>
        <br>
        <input class="button" type="submit" value="Submit">
    </form>
</div>
<hr>
