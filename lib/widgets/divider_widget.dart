import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

Container dividerWidget() {
  return Container(
    height: 1,
    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    color: CustomColors.divederLine.withOpacity(0.5),
  );
}
