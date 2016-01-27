$('.nav').on('click', 'li', function(event) {
    event.preventDefault();
    var link = $(this).find('a').attr('href');
    $('#content').load(link);
    window.history.pushState(null, null, '#'+link);
});

$(window).on('hashchange', function(event) {
    var page = window.location.hash.substring(1);
    $('#content').load(page);
});
