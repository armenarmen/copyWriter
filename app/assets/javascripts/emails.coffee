# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

    $body = $ "#email-body"
    $body.mouseup ->

        # This is where we get the selected text and feed it into 
        # new comment form.

        selObj = window.getSelection()
        range = selObj.getRangeAt 0
        if range.startOffset != range.endOffset
            $('#new-comment').show()
    
            $('#comment_char_began_at').val(parseInt(range.startOffset))
            $('#comment_char_ended_at').val(parseInt(range.endOffset))
        else
            alert "ass"
            $('#new-comment').hide()
    

    $comments = $ ".commented"


    ## This bit is just to make comments more interactive
    $comments.mouseover ->
        $(@).css("background-color", "red");
    $comments.mouseout ->
        $(@).css("background-color", "yellow");


    # ---------------
    # Toggling between read and write views
    $read_comment = $ "#read-comments"
    $write_comment = $ "#write-comments"

    $read_comment.click ->
        $('#commented-body').css("z-index", "2")
        $('#email-body').css("z-index", "1")

    $write_comment.click ->
        $('#commented-body').css("z-index", "1")
        $('#email-body').css("z-index", "2")

    # -------------

    $current_comment = $ "#current-comment"

    $comments.click ->
        # This gets the comment.id from the highlighted one clicked.
        my_class_number = "." + $(@).attr("class").replace('commented ','')
        console.log my_class_number
        console.log $current_comment.text()

        # find the text of the comment and put it into the current_comment DIV

        my_text = $( "#{my_class_number}:first" ).text();

        $current_comment.html(my_text)

        console.log $(my_class_number).length

        console.log $(my_class_number).prev().text()

        console.log $( "#{my_class_number}:first" ).text();
