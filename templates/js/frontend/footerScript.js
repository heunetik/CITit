$(document).ready(function() {
    var defaultHeight = $(document).height();
    $(document).on("mousemove", function(e) {
        var coord_height = e.pageY;
        percent = coord_height / defaultHeight * 100;
        percent = parseInt(percent, 10);

        if(percent >= 97) {
            $(".debugger").css('display','block');
        } else {
            $(".debugger").css('display','none');
        }
    });
});