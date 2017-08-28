
<form action="{SITE_URL}/admin/article/delete_reply/id/{REPLY_ID}" method="post" >
<input type="hidden" name="userToken" value="{USERTOKEN}">
		<li class="clearfix">
			<p>Are you sure you want to delete this reply ?</p>
		</li>
	<div class="rounded-corners box-shadow" style="width: 600px">
		<div class="box_header round-left-right-top">
			Delete article: {REPLY_CONTENT}
				
		</div>
		<ul class="form delete">
			<li class="clearfix">
				<input type="checkbox" name="confirm"><label>Confirm deletion</label>
				<input type="submit" class="button" value="YES" style="float: left; margin-right:10px;">
				<input type="button" onclick="window.location = '{SITE_URL}/admin/article/show_single_article/id/{REPLY_POSTID}'" class="button" value="Cancel">
			</li>
		</ul>
	</div>
</form>