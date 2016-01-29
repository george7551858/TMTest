'use strict';

var APPID = '8307197f7df3592b62a58d13443b2185';


function getIconName(text) {
    var weatherIconList = ['cloud', 'rain', 'clear', 'snow'];
    for (var i = weatherIconList.length - 1; i >= 0; i--) {
        var iconName = weatherIconList[i];
        if (text.search(iconName) >= 0) {
            return iconName;
        }
    }
    return 'na';
}

function showErrorMsg(msg) {
    $('#error-msg').text(msg).show();
}

function showWeather(resp) {
    $('.weather-wrapper').show();

    $('#city-name').text(resp.name);

    for (var item in resp.main) {
        if (resp.main.hasOwnProperty(item)) {
            $('#' + item).text(resp.main[item]);
        }
    }

    var className = getIconName(resp.weather[0].description);
    // TODO: use resp.weather.icon
    $('#weather-icon').attr('class', 'sprite-' + className);

    $('#weather-main').text(resp.weather[0].main);
    $('#weather-description').text(resp.weather[0].description);
}


$('#ask-weather').on('submit', function(event) {
    event.preventDefault();
    var city = $('[name=city]').val();
    var country = $('[name=country]').val();
    var query = city + ',' + country;
    $('#error-msg').hide();
    $('#loading').show();

    $.get('http://api.openweathermap.org/data/2.5/weather?q=' + query + '&APPID=' + APPID + '&units=metric', function(resp) {

        $('#loading').hide();

        if (resp.cod !== 200) {
            showErrorMsg(resp.message);
            return;
        }

        showWeather(resp);
    });
});

$('#ask-weather').submit();
