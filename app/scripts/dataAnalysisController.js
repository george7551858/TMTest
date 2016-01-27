'use strict';

function initDygraph() {
    var g = new Dygraph(
        // containing div
        document.getElementById('visualization'),
        $('#data-text').val()
    );

    $('#data-form').on('submit', function(event) {
        event.preventDefault();
        var data = $('#data-text').val();
        g.updateOptions( { 'file': data } );
    });
}

initDygraph();
