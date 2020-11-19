import 'dart:convert';

import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:http/http.dart' as Http;
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // Full example
  // void getLocationData() async {
  //   Http.Response response = await Http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
  //   if (response.statusCode == 200) {
  //   var decodedData = jsonDecode(response.body);
  //   // print(data);

  //   double temperature = decodedData['main']['temp'];
  //   int condition = decodedData['weather'][0]['id'];
  //   String cityName = decodedData['name'];

  //   print(temperature);
  //   print(condition);
  //   print(cityName);

  //   var weatherDesc = decodedData['weather'][0]['description'];
  //   print(weatherDesc);

  //   } else {
  //     print('is not 200');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
