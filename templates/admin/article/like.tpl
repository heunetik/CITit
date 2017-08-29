<style type="text/css">
.button1 {
    background-color: #808080; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
.button5:hover {
    background-color: #000000;
    color: white;
}
</style>
<div>
<h2> Article like`s</h2>
<!-- BEGIN like_list -->
<p>{LIKE_USERNAME}</p>
<!-- <p>{ARTICLEID}</p> -->
<!-- END like_list -->
	<a href="{SITE_URL}/admin/article/show_single_article/id/{ARTICLEID}" title="Back"><button class="button1 button5">Back</button></a>
</div>