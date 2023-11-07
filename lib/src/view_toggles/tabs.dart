import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> views;
  final double? viewHeight;
  final int? initialIndex;
  const AppTabBar({
    super.key,
    required this.tabs,
    required this.views,
    this.viewHeight,
    this.initialIndex
  }): assert(tabs.length!=0 && tabs.length==views.length);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex??1,
      length: tabs.length,
      child: Column(
        children: [
          Material(
            color: neutrals100Color,
            child: TabBar(
              padding: const EdgeInsets.all(4),
              dividerColor: neutrals100Color,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: tabs.map((e) => Padding(padding: EdgeInsets.all(8),child: e)
              ).toList(),
            ),
          ),
          SizedBox(
            height: viewHeight??MediaQuery.of(context).size.width,
            child: TabBarView(
              children: views,
            ),
          ),
        ],
      ),
    );
  }
}
