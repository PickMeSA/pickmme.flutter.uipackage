import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/constants/colors.dart';

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
    this.onSelected,
    this.onDeleted,
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
            child: Builder(
              builder: (context) {
                if(onDeleted != null) {
                  return InputChip(
                    deleteIconColor: secondaryColor,
                    label: Text(e.label),
                    // selected: selectedIndex == index,
                    onSelected: onSelected,
                    onDeleted: onDeleted,
                  );
                }
                return ActionChip(
                  label: Text(e.label),
                  onPressed: (){},
                );
              }
            ),
          )).toList(),
        ),

      ],
    );
  }

}