<script>
function deleteArticle(id)
{
    if (confirm("Are you sure you want to delete the article?")) {

        var articleData = {};

        articleData = {
                id : id,
                delete : 1
        };
        // var articleData = [id, textareaValue];
        console.log(articleData);
        $.ajax({
            type: 'POST',
            data: articleData,
            success: function (data) {
                location.reload();
            }
        });
        $("#ARTICLE_"+id).remove();
    }
}
</script>
{PAGINATION}
<div id="adminList" class="box-shadow">
    <table class="big_table" frame="box" rules="all">
        <thead>
            <tr>
                <th style="text-align: center; width: 20px;"><span>#</span></th>
                <th><span>CONTENT</span></th>
                <th><span>DATE</span></th>
                <th width="300px"><span>Action</span></th>
            </tr>
        </thead>
        <tbody>
        <!-- BEGIN article_list -->
            <tr ARTICLE_{ARTICLE_ID}>
                <td><a class="button" href="{SITE_URL}/admin/article/show/id/{ARTICLE_ID}">{ARTICLE_ID}</a></td>
                <td>{ARTICLE_CONTENT}</td>
                <td>{ARTICLE_DATE}</td>
                <td>
                    <table class="action_table">
                        <tr>
                            <td width="20%"><a href="{SITE_URL}/admin/article/edit/id/{ARTICLE_ID}" title="Edit/Update" class="edit_state">Edit</a></td>
                            <td width="25%"><a href="" class="delete_state deleteArticle deleteButton_{ARTICLE_ID}" onclick="deleteArticle({ARTICLE_ID})" title="Delete">Delete</a></td>
                            </tr>
                    </table>
                </td>
            </tr>
        <!-- END article_list -->
        </tbody>
    </table>
</div>