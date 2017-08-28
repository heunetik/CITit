<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<div id="adminList" class="box-shadow">
    <table class="big_table" frame="box" rules="all">
   	 <thead>
   		 <tr>
   			 <th style="text-align: center; width: 20px;">#</th>
   			 <th><span>Content</span></th>
   			 <th><span>Date</span></th>
   			 <th width="230px">Action</th>
   		</tr>	 			
   	 </thead>
   	 <tbody>
		<!-- BEGIN article_list -->
   		 <tr>
   			 <td style="text-align: center;"><a href="{SITE_URL}/admin/article/show_single_article/id/{ARTICLE_ID}">{ARTICLE_ID}</a></td>
   			 <td><a href="{SITE_URL}/admin/article/show_single_article/id/{ARTICLE_ID}">{ARTICLE_CONTENT}</a></td>
   			 <td>{ARTICLE_DATE}</td>
   			 <td>
				<table  class="action_table">
    				<tr>
        				<td width="50%"><a href="{SITE_URL}/admin/article/edit_article/id/{ARTICLE_ID}" title="Edit/Update" class="edit_state">Edit</a></td>
        				<td width="50%"><a href="{SITE_URL}/admin/article/delete_article/id/{ARTICLE_ID}" title="Delete" class="delete_state">Delete</a></td>
    				</tr>
				</table>
			</td>
   			 
   		 </tr>
		<!-- END article_list -->
   	 </tbody>
    </table>
</div>

<script>

</script>
{PAGINATION}
