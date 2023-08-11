import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/global_controller.dart';
import '../widgets/comfort_level.dart';
import '../widgets/daily_data_forcast.dart';
import '../widgets/divider_widget.dart';
import '../widgets/hourly_data_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/main_weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => globalController.checkLoading().isTrue
            ? const loading_widget()
            : ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  main_card(globalController: globalController),
                  HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getWeatherData().getHourlyWeather()),
                  DailyDataForcast(
                      weatherDataDaily:
                          globalController.getWeatherData().getDailyWeather()),
                  dividerWidget(),
                  ComfortLevel(
                      weatherDataCurrent:
                          globalController.getWeatherData().getCurrentWeather())
                ],
              ),
      ),
    );
  }
}
