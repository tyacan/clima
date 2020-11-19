import 'location.dart';
import 'networking.dart';

const apiKey = '41baf43770b55631221dd40eb12873ce';
const weatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather?appid=$apiKey&units=metric';

class WeatherModel {
  String _myLocation;

  Future<dynamic> getCityWeather(cityName) async {
    var url = '$weatherMapURL&q=$cityName';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    // _myLocation = ' lat: ' +  location.latitude.toString() + ' lng: ' + location.longitude.toString();
    _myLocation = location.getGoogleMapShareLink();
    print(_myLocation);

    String url =
        '$weatherMapURL&lat=${location.getLat().toString()}&lon=${location.getLong().toString()}';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
