import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../model/weather_data_current.dart';
import '../utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 20,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                        handlerSize: 0,
                        progressBarWidth: 15,
                        trackWidth: 12,
                      ),
                      infoProperties: InfoProperties(
                          mainLabelStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          bottomLabelText: "Humidity",
                          bottomLabelStyle: const TextStyle(
                              letterSpacing: 0.1,
                              fontSize: 15,
                              height: 1.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      animationEnabled: true,
                      size: 150,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomColors.firstGradiantColor.withAlpha(100),
                          progressBarColors: [
                            CustomColors.firstGradiantColor,
                            CustomColors.secondGradiantColor
                          ])),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Feels Like : ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 0.8,
                        )),
                    TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 0.8,
                        ))
                  ])),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    width: 1,
                    height: 15,
                    color: CustomColors.divederLine,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "UV Index : ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 0.8,
                        )),
                    TextSpan(
                        text: "${weatherDataCurrent.current.uvIndex}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 0.8,
                        ))
                  ]))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
