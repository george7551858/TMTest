function page_init() {
    var g = new Dygraph(
    // containing div
    document.getElementById("visualization"),
    [
        [2007,106898,97516],
        [2008,103937,94796],
        [2009,99492,91818],
        [2010,87213,79673],
        [2011,101943,94684],
        [2012,118848,110633],
        [2013,103120,95993]
    ],
    {
        labels: [ "Year", "Men", "Female" ]
    });
}
