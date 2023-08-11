import 'package:flutter/material.dart';
import '../controller/global_controller.dart';
import 'current_weather_widget.dart';
import 'header_widget.dart';

// ignore: camel_case_types
class main_card extends StatelessWidget {
  const main_card({
    super.key,
    required this.globalController,
  });

  final GlobalController globalController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 630,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF29a0ff), width: 1),
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(colors: [
          Color(0xFF15c2f5),
          Color(0xFF1069f3),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        boxShadow: const [
          BoxShadow(
              color: Color(0xFF1069f3),
              offset: Offset(0.0, 5.0), //(x,y)
              blurRadius: 20.0,
              spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          const HeaderWidget(),
          CurrentWeather(
              weatherDataCurrent:
                  globalController.getWeatherData().getCurrentWeather()),
        ],
      ),
    );
  }
}
