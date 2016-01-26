window.onload = function () {
    var container = document.getElementById('visualization');
    var items = [
        {x: '2007', y: 106898, group: 0},
        {x: '2008', y: 103937, group: 0},
        {x: '2009', y: 99492, group: 0},
        {x: '2010', y: 87213, group: 0},
        {x: '2011', y: 101943, group: 0},
        {x: '2012', y: 118848, group: 0},
        {x: '2013', y: 103120, group: 0},
        {x: '2007', y: 97516, group: 1},
        {x: '2008', y: 94796, group: 1},
        {x: '2009', y: 91818, group: 1},
        {x: '2010', y: 79673, group: 1},
        {x: '2011', y: 94684, group: 1},
        {x: '2012', y: 110633, group: 1},
        {x: '2013', y: 95993, group: 1},
    ];
    var dataset = new vis.DataSet(items);
    var options = {
        start: '2007',
        end: '2013'
    };
    var graph2d = new vis.Graph2d(container, dataset, options);
};
