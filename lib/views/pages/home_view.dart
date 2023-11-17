import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:neden_sevk_application/views/pages/bekleyen_cuvallar.dart';
import 'package:neden_sevk_application/views/pages/gecmis_sevkler.dart';
import 'package:neden_sevk_application/views/pages/sevk_olustur.dart';
import 'package:neden_sevk_application/views/themes/colors.dart';
import 'package:neden_sevk_application/views/widgets/bottom_nav_bat.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: IndexedStack(
        index: NedenNavBar.selectedPage,
        children: const [
          BekleyenCuvallar(),
          SevkOlustur(),
          YapilmisSevkler()
        ],
      ),bottomNavigationBar: CurvedNavigationBar(
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
        ]),
    );
  }
}
