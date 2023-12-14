import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
   AppTabBar({super.key,
    required this.tabs,
    required this.tabBarViews,
    this.title,});

  List<Widget> tabs;
List<Widget> tabBarViews;
  String? title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
            tabs: tabs,
          ),
          title:  Text(title??""),
        ),
        body:  TabBarView(
          children: tabBarViews
        ),
      ),
    );
  }
}
