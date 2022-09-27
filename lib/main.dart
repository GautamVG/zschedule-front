import 'package:flutter/material.dart';

import 'theme/theme.dart';
import 'layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ZSchedule', theme: AppTheme, home: const Layout());
  }
}
