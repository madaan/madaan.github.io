$(document).ready(function() {
    $('a.abstract').click(function() {
        $(this).parent().parent().find(".abstract.hidden").toggleClass('open');
    });
    $('a.bibtex').click(function() {
        $(this).parent().parent().find(".bibtex.hidden").toggleClass('open');
    });
    $('a.iframe').click(function() {
        $(this).parent().parent().parent().find(".iframe.hidden").toggleClass('open');
    });

    $(".post-tag").click(function() {
        var id = "#div-" + $(this).attr("id");
        $(this).toggleClass("clicked");
        $(id).toggle();
    });
});
