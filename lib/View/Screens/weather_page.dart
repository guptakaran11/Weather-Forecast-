//* Packages
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

//* Widgets
import '../Widgets/weather_data_tile.dart';

//* Services
import '../../Controller/Services/api_keys.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _HomePageState();
}

class _HomePageState extends State<WeatherPage> {
  final TextEditingController controller = TextEditingController();

  String bgImg = 'assets/images/clear.jpg';
  String iconImg = 'assets/icons/Clear.png';
  String placeName = '';
  String temperature = '';
  String tempMax = '';
  String tempMin = '';
  String sunrise = '';
  String sunset = '';
  String main = '';
  String pressure = '';
  String humidity = '';
  String visibility = '';
  String windSpeed = '';

  getData(String cityName) async {
    final weatherService = WeatherService();
    Map<String, dynamic> weatherData;
    if (cityName == '') {
      weatherData = await weatherService.fetchWeatherData(cityName);
    } else {
      weatherData = await weatherService.getWeatherData(cityName);
    }
    log(cityName);
    log(weatherData.toString());
    // debugPrint(
    //   weatherData.toString(),
    // );
    setState(() {
      placeName = weatherData['name'];
      temperature = weatherData['main']['temp'].toStringAsFixed(1);
      main = weatherData['weather'][0]['main'];
      tempMax = weatherData['main']['temp_max'].toStringAsFixed(1);
      tempMin = weatherData['main']['temp_min'].toStringAsFixed(1);
      sunrise = DateFormat('hh:mm a').format(
          DateTime.fromMillisecondsSinceEpoch(
              weatherData['sys']['sunrise'] * 1000));
      sunset = DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(
          weatherData['sys']['sunset'] * 1000));
      pressure = weatherData['main']['pressure'].toString();
      humidity = weatherData['main']['humidity'].toString();
      visibility = weatherData['visibility'].toString();
      windSpeed = weatherData['wind']['speed'].toString();
      if (main == 'Clear') {
        bgImg = 'assets/images/clear.jpg';
        iconImg = 'assets/icons/Clear.png';
      } else if (main == 'Clouds') {
        bgImg = 'assets/images/clouds.jpg';
        iconImg = 'assets/icons/Clouds.png';
      } else if (main == 'Rain') {
        bgImg = 'assets/images/rain.jpg';
        iconImg = 'assets/icons/Rain.png';
      } else if (main == 'Fog') {
        bgImg = 'assets/images/fog.jpg';
        iconImg = 'assets/icons/Haze.png';
      } else if (main == 'Thunderstorm') {
        bgImg = 'assets/images/thunderstorm.jpg';
        iconImg = 'assets/icons/Thunderstorm.png';
      } else {
        bgImg = 'assets/images/haze.jpg';
        iconImg = 'assets/icons/Haze.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            bgImg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: controller,
                    onChanged: (value) {
                      getData(value);
                    },
                    decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                      ),
                      filled: true,
                      fillColor: Colors.black26,
                      hintText: "Enter city name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                      ),
                      Text(
                        placeName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$temperature °C',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        main,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Image.asset(
                        iconImg,
                        height: 80,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_upward_rounded),
                      Text(
                        '$tempMax°C',
                        style: const TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Icon(
                        Icons.arrow_downward_rounded,
                      ),
                      Text(
                        '$tempMin°C',
                        style: const TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          WeatherDataTile(
                            index1: "Sunrise",
                            index2: "Sunset",
                            value1: sunrise,
                            value2: sunset,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          WeatherDataTile(
                            index1: "Humidity",
                            index2: "Visibility",
                            value1: humidity,
                            value2: visibility,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          WeatherDataTile(
                            index1: "Precipitation",
                            index2: "Wind Speed",
                            value1: pressure,
                            value2: windSpeed,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
      getData('');
    }
    getData('');
    return true;
  }
}
