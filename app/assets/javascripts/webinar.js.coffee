$ ->

  $(".youtubeModalButton").on "click", (e) ->
    src = $(this).attr("data-src")
    height = $(this).attr("data-height")
    width = $(this).attr("data-width")
    $("#youtubeModal iframe").attr
      src: src
      height: height
      width: width
