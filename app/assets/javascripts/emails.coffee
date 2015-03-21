# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

    $body = $ "#email-body"
    $body.mouseup ->

        # This is where we get the selected text and feed it into 
        # new comment form.

        selObj = window.getSelection()
        console.log selObj
        range = selObj.getRangeAt 0

        if range.startOffset != range.endOffset and range.endOffset > range.startOffset
            $('#new-comment').show()
            $('#comment_char_began_at').val(parseInt(range.startOffset))
            $('#comment_char_ended_at').val(parseInt(range.endOffset))
            $('#commented-body').css("z-index", "1")
            $('#email-body').css("z-index", "2")
        else
            $('#new-comment').hide()
            $('#commented-body').css("z-index", "2")
            $('#email-body').css("z-index", "1")

    commented_body = $ "#commented-body" ###### other thing....
    commented_body.mouseup ->
        if window.getSelection()
            searchParam = window.getSelection().toString()

            #### MOVE THE EMAIL BODY BACK UP TO THE TOP BRUH ####
            $('#commented-body').css("z-index", "1")
            $('#email-body').css("z-index", "2")

            #### NOW FIND THE SEARCH PARAM IN THE EMAIL BODY ###
            $beginSearchParam = $('#email-body').text().search(searchParam)
            $endSearchParam = $beginSearchParam + searchParam.length
            
            if $beginSearchParam != ($beginSearchParam + $endSearchParam)
                $('#new-comment').show()
                $('#comment_char_began_at').val($beginSearchParam)
                $('#comment_char_ended_at').val($endSearchParam)


    $comments = $ ".commented"


    ## This bit is just to make comments more interactive
    $comments.mouseover ->
        $(@).css("background-color", "red");
    $comments.mouseout ->
        $(@).css("background-color", "yellow");


    $current_comment = $ "#current-comment"

    $comments.click ->
        # This gets the comment.id from the highlighted one clicked.
        my_class_number = "." + $(@).attr("class").replace('commented ','')

        # find the text of the comment and put it into the current_comment DIV

        my_text = $( "#{my_class_number}:first" ).text();

        $current_comment.html(my_text)

        console.log $(my_class_number).length

        console.log $(my_class_number).prev().text()

        console.log $( "#{my_class_number}:first" ).text();
