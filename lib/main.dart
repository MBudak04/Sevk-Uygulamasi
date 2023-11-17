import 'package:flutter/material.dart';
import 'package:neden_sevk_application/core/feature/remember_me.dart';
import 'package:neden_sevk_application/views/pages/home_view.dart';
import 'package:neden_sevk_application/views/pages/login_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  runApp(ResponsiveSizer(builder: (context, orientation, screenType) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          "/HomeView": (BuildContext context) => const HomeView(),
          "/LoginView": (BuildContext context) => const LoginView(),
        },
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<bool>(
          future: RememberMe().getRememberMeStatus(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return const HomeView();
            } else {
              return const LoginView();
            }
          },
        ));
  }));
}
