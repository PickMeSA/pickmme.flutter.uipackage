import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../extensions/string.dart';

class OTPInput extends StatefulWidget{
  const OTPInput({super.key, this.onSubmitted});

  @override
  State<StatefulWidget> createState() => OTPInputState();
  final ValueChanged<int>? onSubmitted;

}
class OTPInputState extends State<OTPInput>{
  bool deleted = false;
  TextSelectionControls? _selectionControls;

  Map<String, TextEditingController> controllers = {
    "controller1": TextEditingController(),
    "controller2": TextEditingController(),
    "controller3": TextEditingController(),
    "controller4": TextEditingController(),
  };
  Map<String, FocusNode> focusNodes = {
    "digitNode1": FocusNode(),
    "digitNode2": FocusNode(),
    "digitNode3": FocusNode(),
    "digitNode4": FocusNode(),
  };

  Future<void> paste(final TextSelectionDelegate? delegate) async {

    final TextSelection selection = controllers["controller1"]!.selection;
    if (!selection.isValid) {
      return;
    }
    // Snapshot the input before using `await`.
    // See https://github.com/flutter/flutter/issues/11427
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text ?? '';
    if (text.isEmpty) {
      return;
    }
    for(int i =0; i<text.length; i++){
      if(i<=3){
        setState(() {
          controllers["controller${i+1}"]!.text = text[i+1];
        });
        // FocusScope.of(context).nextFocus();
      }
    }
  }
  @override
  void initState() {
    if (Platform.isIOS) {
      _selectionControls = AppCupertinoTextSelectionControls(
        onPaste: paste,
      );
    } else {
      _selectionControls = AppMaterialTextSelectionControls(
        onPaste: paste,
      );
    }
    super.initState();
  }
  Widget digitInput({required FocusNode focusNode,required TextEditingController controller,}){
    return SizedBox(
      width: 72,
      height: 73,
      child: TextFormField(
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textInputAction: TextInputAction.next,
        selectionControls: _selectionControls,
        textAlignVertical: TextAlignVertical.center,
          style: TextStyle( fontSize: 28),
        onChanged: (String s) {
          if(s.isNumeric()){
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
            counterText: '',
          contentPadding: EdgeInsets.all(15)
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          digitInput(
            focusNode: focusNodes["digitNode1"]!,
            controller: controllers["controller1"]!,
          ),
          digitInput(
            focusNode: focusNodes["digitNode2"]!,
            controller: controllers["controller2"]!,
          ),
          digitInput(
            focusNode: focusNodes["digitNode3"]!,
            controller: controllers["controller3"]!,
          ),
          digitInput(
            focusNode: focusNodes["digitNode4"]!,
            controller: controllers["controller4"]!,
          ),
        ],
      ),
    );
  }

}
class AppCupertinoTextSelectionControls extends CupertinoTextSelectionControls {
  AppCupertinoTextSelectionControls({
    required this.onPaste,
  });
  ValueChanged<TextSelectionDelegate> onPaste;
  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) {
    onPaste(delegate);
    return super.handlePaste(delegate);
  }
}

class AppMaterialTextSelectionControls extends MaterialTextSelectionControls {
  AppMaterialTextSelectionControls({
    required this.onPaste,
  });
  ValueChanged<TextSelectionDelegate> onPaste;
  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) {
    onPaste(delegate);
    return super.handlePaste(delegate);
  }
}