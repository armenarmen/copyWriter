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
        
    $comments.click ->
        $('.posted-comments').toggle()