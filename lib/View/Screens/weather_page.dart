//* Packages
import 'package:flutter/material.dart';

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
  String cityName = '';
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
    final weatherData = await weatherService.getWeatherData(cityName);
    debugPrint(weatherData.toString());
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/haze.jpg",
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
                  const TextField(
                    decoration: InputDecoration(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                      ),
                      Text(
                        'Pune',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '30.9 °C',
                    style: TextStyle(
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
                      const Text(
                        'Haze',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Image.asset(
                        'assets/icons/Haze.png',
                        height: 80,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.arrow_upward_rounded),
                      Text(
                        '35°C',
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.arrow_downward_rounded,
                      ),
                      Text(
                        '25°C',
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Card(
                    elevation: 5,
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          WeatherDataTile(
                            index1: "Sunrise",
                            index2: "Sunset",
                            value1: "6:15 AM",
                            value2: "6:00 PM",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          WeatherDataTile(
                            index1: "Humidity",
                            index2: "Visibility",
                            value1: "4",
                            value2: "10000",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          WeatherDataTile(
                            index1: "Precipitation",
                            index2: "Wind Speed",
                            value1: "6",
                            value2: "45",
                          ),
                          SizedBox(
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
}
