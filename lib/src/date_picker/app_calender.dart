import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

appCalender({
  required BuildContext context,
  required Function onSelected,
  required String hint,
  required String label}){
  showDialog(context: (context), builder: (context){
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: AppTextField(
          controller: TextEditingController(),
          textFieldType: TextFieldType.NUMBER,
          labelText: label,
          hint: hint,
          suffix: Column(
            children: [
              const TextField(
                decoration: InputDecoration(),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: CalendarCarousel(

                  selectedDateTime: DateTime.now(),
                  showHeader: true,
                  showHeaderButton: true,
                  viewportFraction: 1,
                  height: 380,
                  rightButtonIcon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3,),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: const Icon(Icons.chevron_right)),
                  leftButtonIcon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3,),
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(Radius.circular(12))
                      ),
                      child: const Icon(Icons.chevron_left)),
                  firstDayOfWeek: 0,
                  weekdayTextStyle: const TextStyle(color: Colors.black45),
                  daysTextStyle: const TextStyle(color: Colors.black),
                  weekendTextStyle: const TextStyle(color: Colors.black),
                  selectedDayTextStyle: const TextStyle(color: Colors.white),
                  headerTextStyle:const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600) ,
                ),
              ),
            ],
          )
      ),
    );
  });
}