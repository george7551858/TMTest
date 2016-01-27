var APPID="8307197f7df3592b62a58d13443b2185";


function get_icon_name (text) {
    var weather_icon_list = ['cloud', 'rain', 'clear', 'snow'];
    for (var i = weather_icon_list.length - 1; i >= 0; i--) {
        var icon_name = weather_icon_list[i];
        if (text.search(icon_name) >= 0) {
            return icon_name;
        }
    }
    return 'na';
}

function show_error_msg (msg) {
    $('#error-msg').text(msg).show();
    $('#loading').hide();
}

function show_weather (resp) {
    $('.weather-wrapper').show();

    $('#city-name').text(resp.name);

    for (var item in resp.main) {
        if (resp.main.hasOwnProperty(item)) {
            $('#'+item).text(resp.main[item]);
        }
    }

    var class_name = get_icon_name(resp.weather[0].description);    
    // TODO: use resp.weather.icon
    $('#weather-icon').attr('class','sprite-'+class_name);

    $('#weather-main').text(resp.weather[0].main);
    $('#weather-description').text(resp.weather[0].description);
}


$('#ask-weather').on('submit', function(event) {
    event.preventDefault();
    var city = $('[name=city]').val();
    var country = $('[name=country]').val();
    var query = city+","+country;
    $('#error-msg').hide();
    $('#loading').show();

    $.get( 'http://api.openweathermap.org/data/2.5/weather?q='+query+'&APPID='+APPID+'&units=metric', function(resp){
        
        if (resp.cod !== 200) {
            show_error_msg(resp.message);
            return;
        }

        show_weather(resp);
        $('#loading').hide();
    });
});