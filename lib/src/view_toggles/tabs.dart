import 'package:flutter/material.dart';

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
            color: const Color(0xFFF9F9F9),
            child: TabBar(
              padding: const EdgeInsets.all(4),
              dividerColor: const Color(0xFFF9F9F9),
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
