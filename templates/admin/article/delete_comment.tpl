
<form action="{SITE_URL}/admin/article/delete_comment/id/{COMMENT_ID}" method="post" >
<input type="hidden" name="userToken" value="{USERTOKEN}">
	<div class="rounded-corners box-shadow" style="width: 600px">
		<div class="box_header round-left-right-top">
			Delete Comment:  {COMMENT_MESSAGE}
		</div>
		<ul class="form delete">
			<li class="clearfix">
				<p>Are you sure you want to delete this comment ?</p>
			</li>
			<li class="clearfix">
				<input type="checkbox" name="confirm"><label>Confirm deletion</label>
				<input type="submit" class="button" value="YES" style="float: left; margin-right:10px;">
				<input type="button" onclick="window.location = '{SITE_URL}/admin/article/show_single_article/id/{COMMENT_POSTID}'" class="button" value="Cancel">
			</li>
		</ul>
	</div>
</form>