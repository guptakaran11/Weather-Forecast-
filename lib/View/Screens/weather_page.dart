import 'package:flutter/material.dart';

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
      ],
    ));
  }
}
