import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final double currentSliderValue;
  final double minimumSliderValue;
  final double maximumSliderValue;
  final ValueChanged<double>? onChanged;

  const AppSlider({
    super.key,
    this.currentSliderValue = 0,
    this.minimumSliderValue = 0,
    this.maximumSliderValue = 100,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: currentSliderValue,
      max: maximumSliderValue,
      // divisions: 5,
      label: currentSliderValue.round().toString(),
      onChanged: onChanged,
    );
  }
}