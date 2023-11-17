import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:neden_sevk_application/views/themes/colors.dart';

class NedenNavBar extends StatefulWidget {
  static int selectedPage = 0;
  const NedenNavBar({
    super.key,
  });

  @override
  State<NedenNavBar> createState() => _NedenNavBarState();
}

class _NedenNavBarState extends State<NedenNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: NedenColors.lacivert,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (value) {
          setState(() {
            NedenNavBar.selectedPage = value;
          });
        },
        letIndexChange: (value) => true,
        items: const [
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            color: Colors.white,
          ),
        ]);
  }
}
