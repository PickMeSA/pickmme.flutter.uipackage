import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> views;
  final double? viewHeight;
  final int? initialIndex;
  final Function(int index) onTap;
  final bool isScrollable;
  final TabBarIndicatorSize indicatorSize;

  const AppTabBar({
    super.key,
    required this.tabs,
    required this.views,
    this.viewHeight,
    this.initialIndex,
    this.isScrollable = false,
    this.indicatorSize = TabBarIndicatorSize.tab,
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
              indicatorColor: primaryColor,
              isScrollable: isScrollable,
              padding: const EdgeInsets.all(4),
              dividerColor: neutrals100Color,
              indicatorSize: indicatorSize,
              onTap: (index)=> onTap(index),
              tabs: tabs.map((e) => Padding(padding: const EdgeInsets.all(8),child: e)
              ).toList(),
            ),
          ),
          SizedBox(height: 16,),
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
