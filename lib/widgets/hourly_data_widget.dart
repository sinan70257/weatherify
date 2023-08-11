import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/global_controller.dart';
import '../model/weather_data_hourly.dart';

// ignore: must_be_immutable
class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});

  RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25, left: 10),
          alignment: Alignment.topLeft,
          child: const Text(
            "Today",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
        height: 160,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: weatherDataHourly.hourly.length > 12
              ? 20
              : weatherDataHourly.hourly.length,
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                    border: cardIndex.value != index
                        ? Border.all(width: 1, color: const Color(0xFF1069f3))
                        : null,
                    borderRadius: BorderRadius.circular(10),
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            Color(0xFF15c2f5),
                            Color(0xFF1069f3),
                          ])
                        : null,
                  ),
                  child: HourlyDetails(
                      index: index,
                      cardIndex: cardIndex.toInt(),
                      timestamp: weatherDataHourly.hourly[index].dt!,
                      temp: weatherDataHourly.hourly[index].temp!,
                      weatherIcon:
                          weatherDataHourly.hourly[index].weather![0].icon!),
                )));
          },
        ));
  }
}

// ignore: must_be_immutable
class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timestamp;
  String weatherIcon;
  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat.jm().format(time);
    return x;
  }

  HourlyDetails({
    super.key,
    required this.timestamp,
    required this.temp,
    required this.weatherIcon,
    required this.cardIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timestamp),
              style: cardIndex == index
                  ? const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)
                  : const TextStyle(color: Colors.white)),
        ),
        Container(
          child: cardIndex == index
              ? Image.asset(
                  "assets/weather/$weatherIcon.png",
                  height: 50,
                  width: 50,
                )
              : Image.asset(
                  "assets/weather/$weatherIcon.png",
                  height: 40,
                  width: 40,
                ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("$temp°",
              style: cardIndex == index
                  ? const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
                  : const TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
