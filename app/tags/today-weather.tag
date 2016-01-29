<today-weather>
  <div id="error-msg"></div>
  <form  onsubmit="{ getWeather }" action="#">
    <lable>City: <input type="text" name="city" value="Taipei"/></lable>
    <lable>Country: <input type="text" name="country" value="TW"/></lable>
    <button type="submit">Search</button>
    <img id="loading" src="images/ajax-loader.gif" alt="loading...">
  </form>
  <h2>{ city_name }</h2>
  <div class="weather-wrapper" show={ city_name }>
    <div id="weather-icon" class={ iconClassName }></div>
    <div class="weather-text">
      <div>&mdash; <span id="weather-main">{ weather_main }</span> &mdash;</div>
      <span id="weather-description">{ weather_description }</span>
    </div>
    <div class="weather-item">
      <p class="temp_min_item">Low <span>{ temp_min }</span> °C</p>
      <p class="temp_item"><span>{ temp }</span>°C</p>
      <p class="temp_max_item">Hight <span>{ temp_max }</span>°C</p>
      <br>
      <p class="humidity_item">Humidity: <span>{ humidity }</span> %</p>
      <br>
      <p class="pressure_item">Pressure: <span>{ pressure }</span> hPa</p>
    </div>
  </div>

  <script>

    this.APPID = '8307197f7df3592b62a58d13443b2185'

    getIconName(text) {
        var weatherIconList = ['cloud', 'rain', 'clear', 'snow'];
        for (var i = weatherIconList.length - 1; i >= 0; i--) {
            var iconName = weatherIconList[i];
            if (text.search(iconName) >= 0) {
                return iconName;
            }
        }
        return 'na';
    }

    setWeather(resp) {

      this.city_name = resp.name

      for (var item in resp.main) {
          if (resp.main.hasOwnProperty(item)) {
              this[item] = resp.main[item]
          }
      }

      this.iconClassName = 'sprite-' + this.getIconName(resp.weather[0].description)
      // TODO: use resp.weather.icon

      this.weather_main = resp.weather[0].main
      this.weather_description = resp.weather[0].description
    }

    getWeather() {

      $('#error-msg').hide();
      $('#loading').show();

      var apiUrl = 'http://api.openweathermap.org/data/2.5/weather?'
      var query = this.city.value + ',' + this.country.value;

      var self = this;

      $.get(apiUrl + 'q=' + query + '&APPID=' + this.APPID + '&units=metric', function(resp) {

          $('#loading').hide();

          if (resp.cod !== 200) {
              $('#error-msg').text(resp.message).show();
              return;
          }

          self.setWeather(resp);
          self.update()
      });
    }

    this.on('mount', function() {
      this.getWeather()
    })


  </script>

  <style scoped>
    #error-msg {
        display: none;/**/
        margin: 0 0 10px;
        padding: 5px 10px;
        border: 1px solid #FF6666;
        background-color: #FFEDED;
    }
    #loading {
        display: none;
    }
    #weather-icon {
        background-image: url('../images/icons.png');
        background-repeat: no-repeat;
        width: 60px;
        height: 60px;
        float: left;
    }
    .weather-wrapper {
        width: 240px;
        margin: 0 30px;
        overflow: auto;
    }
    #weather-main {
        font-family: Arial;
        font-weight: bold;
        color: #000;
    }
    .weather-text {
        color: #999;
        text-align: center;
        margin: 10px 20px;
    }
    .weather-item {
        font-family: Arial;
        text-align: right;
        clear: both;
    }
    .weather-item p {
        display: inline;
        font-size: 12px;
    }
    .weather-item .temp_item {
        font-weight: bold;
        font-size: 15px;
    }
    .sprite-cloud  {background-position: -72px -375px; }
    .sprite-rain  {background-position: -288px -375px;}
    .sprite-clear  {background-position: -72px -15px;}
    .sprite-snow  {background-position: -144px -445px;}
    .sprite-na  {background-position: -144px -520px;}
  </style>
</today-weather>
