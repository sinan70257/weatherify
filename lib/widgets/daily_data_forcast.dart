import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/weather_data_daily.dart';

class DailyDataForcast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForcast({super.key, required this.weatherDataDaily});

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat.EEEE().format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1069f3).withAlpha(150),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 25, top: 10),
            alignment: Alignment.center,
            child: const Text(
              "Next Days",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 330,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 90,
                        child: Text(
                          "◉ ${getDay(weatherDataDaily.daily[index].dt)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                          "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                    ),
                    Text(
                      "${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°",
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                ),
              ),
              index != 6
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      height: 1.7,
                      color: const Color.fromARGB(255, 216, 216, 216)
                          .withAlpha(150),
                      width: double.infinity,
                    )
                  : const SizedBox()
            ],
          );
        },
      ),
    );
  }
}
