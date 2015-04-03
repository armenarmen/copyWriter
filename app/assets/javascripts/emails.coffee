# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

    $body = $ "#email-body"
    $current_comment = $ "#current-comment"
    $body.mouseup ->
        console.log "mouse up email-body"
        # This is where we get the selected text and feed it into 
        # new comment form.

        selObj = window.getSelection()
        
        range = selObj.getRangeAt 0

        if range.startOffset != range.endOffset and range.endOffset > range.startOffset
            $('#new-comment').show()
            $("#current-comment-carrier").hide()
            $('#comment_char_began_at').val(parseInt(range.startOffset))
            $('#comment_char_ended_at').val(parseInt(range.endOffset))
            $('#commented-body').css("z-index", "1")
            $('#email-body').css("z-index", "2")
        else
            $current_comment.hide()
            $("#current-comment-carrier").hide() # just added 
            $('#new-comment').hide()
            $('#commented-body').css("z-index", "2")
            $('#email-body').css("z-index", "1")

    $commented_body = $ "#commented-body" ###### other thing....
    $commented_body.mouseup ->
        console.log "mouse up commented-body"
        if window.getSelection()
            $("#current-comment-carrier").show() # just added 
            $("#current-comment").show()
            searchParam = window.getSelection().toString()

            #### MOVE THE EMAIL BODY BACK UP TO THE TOP BRUH ####
            $('#commented-body').css("z-index", "1")
            $('#email-body').css("z-index", "2")

            #### NOW FIND THE SEARCH PARAM IN THE EMAIL BODY ###
            $beginSearchParam = $('#email-body').text().search(searchParam)
            $endSearchParam = $beginSearchParam + searchParam.length
            
            if $beginSearchParam != ($beginSearchParam + $endSearchParam)
                
                $('#new-comment').show()
                $("#current-comment-carrier").hide()
                $('#comment_char_began_at').val($beginSearchParam)
                $('#comment_char_ended_at').val($endSearchParam)
                $current_comment.hide()
                $("#current-comment-carrier").hide() # just added 


    $comments = $ ".commented"


    ####### HIGHLIGHTING ON MOUSEOVER This bit is just to make comments more interactive

    $comments.mouseover ->
        $(@).css("background-color", "red");
    $comments.mouseout ->
        $(@).css("background-color", "yellow");

    #######

    #######
    $comments.click ->
        # This gets the comment.id from the highlighted one clicked.
        my_class_number = "." + $(@).attr("class").replace('commented ','')

        # find the text of the comment and put it into the current_comment DIV
        my_text = $( "#{my_class_number}:first" ).html();
        $("#current-comment-carrier").show()
        $current_comment.html(my_text)


