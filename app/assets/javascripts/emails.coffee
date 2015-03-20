# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$body = $ "#email-body"
	$body.mouseup ->
		selObj = window.getSelection()
		range = selObj.getRangeAt 0
		# alert "#{ range.startOffset } - #{ range.endOffset }"
		$('#new-comment').show()
		#armen = $("comment[char_ended_at]").val()
		$('#comment_char_began_at').val(parseInt(range.startOffset))
		$('#comment_char_ended_at').val(parseInt(range.endOffset))

	$comments = $ ".commented"

	$comments.mouseover ->
        $(@).css("background-color", "red");
	$comments.mouseout ->
        $(@).css("background-color", "yellow");

    #$comments.click ->
    #    console.log $(@).text()
    #    $('.posted-comments').toggle()




    $current_comment = $ "#current-comment"
    $comments.click ->
    #    $current_comment.text($(@).text()) # this one gets text in span...

        

        # This gets the comment.id from the highlighted one clicked.
        my_class_number = "." + $(@).attr("class").replace('commented ','')
        console.log my_class_number
        console.log $current_comment.text()

        # Not, find the text of the comment and put it into the current_comment DIV

        my_text = $( "#{my_class_number}:first" ).text();

        $current_comment.html(my_text)

        console.log $(my_class_number).length

        console.log $(my_class_number).prev().text()

        console.log $( "#{my_class_number}:first" ).text();



















