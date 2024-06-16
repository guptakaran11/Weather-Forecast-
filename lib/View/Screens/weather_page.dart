import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _HomePageState();
}

class _HomePageState extends State<WeatherPage> {
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
                      Icon(Icons.arrow_downward_rounded),
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
                  Card(
                    elevation: 5,
                    color: Colors.transparent,
                    child: Container(
                      height: 300,
                      color: Colors.transparent,
                      child: const Column(
                        children: [
                          Wrap(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Sunrise",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                  ),
                                  Text(
                                    "Sunset",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
