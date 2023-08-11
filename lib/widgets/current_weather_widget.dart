import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/weather_data_current.dart';

// ignore: must_be_immutable
class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  String date = DateFormat.yMMMMd().format(DateTime.now());
  CurrentWeather({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        const SizedBox(
          height: 25,
        ),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(children: [
          Opacity(
              opacity: 0.15,
              child: Image.asset(
                  "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
                  fit: BoxFit.contain,
                  height: 210,
                  width: 220,
                  color: Colors.black)),
          ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Image.asset(
                    "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
                    fit: BoxFit.contain,
                    height: 200,
                    width: 200,
                  )))
        ]),
        Text(
          "  ${weatherDataCurrent.current.temp!.toInt()}°",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 100, color: Colors.white),
        ),
        Text(
          "${weatherDataCurrent.current.weather![0].description}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          alignment: Alignment.center,
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 5),
          height: 1.5,
          color: Colors.white.withOpacity(.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            labeled_icon(Icons.air,
                "${weatherDataCurrent.current.windSpeed}km/h", "Wind"),
            labeled_icon(
                Icons.cloud, "${weatherDataCurrent.current.clouds}%", "Clouds"),
            labeled_icon(Icons.water_drop,
                "${weatherDataCurrent.current.humidity}km/h", "Humidity"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Container labeled_icon(IconData logo, label, hint) {
    return Container(
        child: Column(
      children: [
        Icon(
          logo,
          color: Colors.white,
        ),
        Text(
          label,
          style: TextStyle(
              height: 2.3,
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          hint,
          style: TextStyle(color: Color.fromARGB(255, 236, 236, 236)),
        )
      ],
    ));
  }
}
