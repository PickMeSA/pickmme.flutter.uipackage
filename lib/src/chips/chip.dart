import 'package:flutter/material.dart';

class ChipOption{
  final String label;
  final int id;

  ChipOption({required this.label, required this.id});
}
class ChipGroup extends StatelessWidget{
  final List<ChipOption> inputs;
  /// Function for on selected like
  ///   onSeleted: (bool selected) {
  ///     setState(() {
  ///         if (selectedIndex == index) {
  ///        selectedIndex = null;
  ///         } else {
  ///         selectedIndex = index;
  ///        }
  ///     });
  ///   }
  ///
  final ValueChanged<bool>? onSelected;

  /// Function for on deleted like
  ///   onDeleted: () {
  ///     setState(() {
  ///       inputs = inputs - 1;
  ///     });
  ///   }
  ///
  final VoidCallback? onDeleted;

  const ChipGroup({
    super.key,
    required this.inputs,
    required this.onDeleted,
    required this.onSelected,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5.0,
          children: inputs.map((e) => SizedBox(
            height: 46,
            child: InputChip(
            label: Text(e.label),
      // selected: selectedIndex == index,
      onSelected: onSelected,
      onDeleted: onDeleted,
    ),
          )).toList(),
        ),

      ],
    );
  }

}