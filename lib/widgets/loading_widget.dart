import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

// ignore: camel_case_types
class loading_widget extends StatelessWidget {
  const loading_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [
                  Color(0xFF15c2f5),
                  Color(0xFF1069f3),
                ],
              ).createShader(bounds);
            },
            child: const Text(
              "weatherify.",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 1.5),
            alignment: Alignment.bottomCenter,
            height: 33.2,
            width: 20,
            child: const LoadingIndicator(
              indicatorType: Indicator.ballPulseSync,
              colors: [
                Color(0xFF1069f3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
