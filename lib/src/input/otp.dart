import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../extensions/string.dart';

class OTPInput extends StatefulWidget{
  const OTPInput({super.key, this.onchange, this.length=6});

  @override
  State<StatefulWidget> createState() => OTPInputState();
  final Function(String)? onchange ;
  final int length;

}
class OTPInputState extends State<OTPInput>{

  bool deleted = false;
  late final TextSelectionControls selectionControls;

  Map<String, TextEditingController> controllers = {
    "controller1": TextEditingController(),
    "controller2": TextEditingController(),
    "controller3": TextEditingController(),
    "controller4": TextEditingController(),
    "controller5": TextEditingController(),
    "controller6": TextEditingController()
  };
  Map<String, FocusNode> focusNodes = {
    "digitNode1": FocusNode(),
    "digitNode2": FocusNode(),
    "digitNode3": FocusNode(),
    "digitNode4": FocusNode(),
    "digitNode5": FocusNode(),
    "digitNode6": FocusNode()
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
      selectionControls = AppCupertinoTextSelectionControls(
        onPaste: paste,
      );
    } else {
      selectionControls = AppMaterialTextSelectionControls(
        onPaste: paste,
      );
    }
    super.initState();
  }
  Widget digitInput({required Function onChange ,required FocusNode focusNode,required TextEditingController controller,}){
    return SizedBox(
      width: 52,
      height: 53,
      child: TextFormField(
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textInputAction: TextInputAction.next,
        selectionControls: selectionControls,
        textAlignVertical: TextAlignVertical.center,
          style: const TextStyle( fontSize: 28),
        onChanged: (String s) {
          if(s.isNumeric()){
            onChange(
                  "${controllers["controller1"]?.text}"
                  "${controllers["controller2"]?.text}"
                  "${controllers["controller3"]?.text}"
                  "${controllers["controller4"]?.text}"
                  "${controllers["controller5"]?.text}"
                  "${controllers["controller6"]?.text}"
            );
            FocusScope.of(context).nextFocus();
          }
          if(s.isEmpty){
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
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
            onChange: widget.onchange!,
            focusNode: focusNodes["digitNode1"]!,
            controller: controllers["controller1"]!,
          ),
          digitInput(
            onChange: widget.onchange!,
            focusNode: focusNodes["digitNode2"]!,
            controller: controllers["controller2"]!,
          ),
          digitInput(
            onChange: widget.onchange!,
            focusNode: focusNodes["digitNode3"]!,
            controller: controllers["controller3"]!,
          ),
          digitInput(
            onChange: widget.onchange!,
            focusNode: focusNodes["digitNode4"]!,
            controller: controllers["controller4"]!,
          ),
          digitInput(
            onChange: widget.onchange!,
            focusNode: focusNodes["digitNode5"]!,
            controller: controllers["controller5"]!,
          ),
          digitInput(
            onChange: widget.onchange!,
            focusNode: focusNodes["digitNode6"]!,
            controller: controllers["controller6"]!,
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