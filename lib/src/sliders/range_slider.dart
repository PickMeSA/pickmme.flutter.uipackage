import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRangeSlider extends StatelessWidget {
  final double currentSliderValue;
  final double minimumSliderValue;
  final double maximumSliderValue;
  final ValueChanged<RangeValues> onChanged;
  final RangeValues rangeValues;

  const AppRangeSlider({
    super.key,
    this.currentSliderValue = 0,
    this.minimumSliderValue = 0,
    this.maximumSliderValue = 100,
    required this.onChanged,
    required this.rangeValues
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: rangeValues,
      max: maximumSliderValue,
      labels: RangeLabels(
        rangeValues.start.round().toString(),
        rangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values)=> onChanged(values),
    );
  }
}