'use strict';

$('app').on('click', 'li', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var link = $(this).find('a').attr('href').substring(1);
    riot.route(link);
});

