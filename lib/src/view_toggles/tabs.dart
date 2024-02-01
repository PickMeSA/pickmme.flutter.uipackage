import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> views;
  final double? viewHeight;
  final int? initialIndex;
  final Function(int index) onTap;
  const AppTabBar({
    super.key,
    required this.tabs,
    required this.views,
    this.viewHeight,
    this.initialIndex,
    required this.onTap,
  }): assert(tabs.length!=0 && tabs.length==views.length);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex??0,
      length: tabs.length,
      child: Column(
        children: [
          Material(
            color: neutrals100Color,
            child: TabBar(
              padding: const EdgeInsets.all(4),
              dividerColor: neutrals100Color,
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (index)=> onTap(index),
              tabs: tabs.map((e) => Padding(padding: const EdgeInsets.all(8),child: e)
              ).toList(),
            ),
          ),
          SizedBox(height: 16,),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),

              children: views,
            ),
          ),
        ],
      ),
    );
  }
}
