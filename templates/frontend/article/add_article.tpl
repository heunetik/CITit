<style>
input[type=checkbox]
{
  /* Double-sized Checkboxes */
  -ms-transform: scale(2); /* IE */
  -moz-transform: scale(2); /* FF */
  -webkit-transform: scale(2); /* Safari and Chrome */
  -o-transform: scale(2); /* Opera */
  padding: 10px;
}

/* Might want to wrap a span around your checkbox text */
.checkboxtext
{
  /* Checkbox text */
  font-size: 110%;
  display: inline;
}
</style>
<h1>New post</h1>
<br>
<div>
    <!-- <form style="display: block" method="POST">
        <label>Title:</label><input type="text" name="firstname" value="Mickey">
        <br>
        <textarea rows="12" cols="80" name="content" placeholder="Put your content here"></textarea>
        <select>
          <option value="0">Text</option>
          <option value="1">Media</option>
        </select>
        <input class="button" type="submit" value="Submit">
    </form> -->
    <form id="userRegister" action="" method="post">
        <ul class="form">
            <li class="clearfix">
                <label for="title">Post Title:</label>
                <input id="title" type="text" value="" name="title">
            </li>
            <li class="clearfix">
                <label for="title">SubCITit:</label>
                <input id="sub" type="text" value="" name="sub">
            </li>
            <li>
                <label for="title">Link:</label>
                <span class="checkboxtext"><input id="checkBox" type="checkbox" name="type"></span>
            </li>
            <hr>
            <li class="clearfix">
                <label for="title">Content:</label>
                <textarea rows="6" cols="80" name="content" placeholder="Put your content here"></textarea>
            </li>
            <li class="clearfix">
                <label class="empty">&nbsp;</label>
                <input type="submit" class="button" value="Submit">
            </li>
        </ul>
    </form>
</div>
<hr>