import 'package:flutter/material.dart';

import 'package:zschedule/theme/theme.dart';

import 'package:zschedule/pages/home.dart';
import 'package:zschedule/pages/signin.dart';
import 'package:zschedule/pages/newBooking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZSchedule', 
      theme: AppTheme,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SignInPage.routeName: (context) => const SignInPage(),
        NewBookingPage.routeName: (context) => const NewBookingPage()
      }
    );
  }
}
