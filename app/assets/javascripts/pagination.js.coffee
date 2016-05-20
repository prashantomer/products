jQuery ->
	if $('#infinite-scrolling').size() > 0
		$(window).on 'scroll', ->
			more_questions_url = $('.pagination a.next_page').attr('href')
			if more_questions_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
				$('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..."/>')
				$.getScript more_questions_url
			return
	return