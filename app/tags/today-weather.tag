<today-weather>
  <div id="error-msg"></div>
  <form action="#" id="ask-weather">
    <lable>City: <input type="text" name="city" value="Taipei"/></lable>
    <lable>Country: <input type="text" name="country" value="TW"/></lable>
    <button type="submit">Search</button>
    <img id="loading" src="images/ajax-loader.gif" alt="loading...">
  </form>
  <h2 id="city-name"></h2>
  <div class="weather-wrapper">
    <div id="weather-icon"></div>
    <div class="weather-text">
      <div>&mdash; <span id="weather-main"></span> &mdash;</div>
      <span id="weather-description"></span>
    </div>
    <div class="weather-item">
      <p class="temp_min_item">Low <span id="temp_min"></span> °C</p>
      <p class="temp_item"><span id="temp"></span>°C</p>
      <p class="temp_max_item">Hight <span id="temp_max"></span>°C</p>
      <br>
      <p class="humidity_item">Humidity: <span id="humidity"></span> %</p>
      <br>
      <p class="pressure_item">Pressure: <span id="pressure"></span> hPa</p>
    </div>
  </div>

  <script>
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
        display: none;
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
