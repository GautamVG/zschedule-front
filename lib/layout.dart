import 'package:flutter/material.dart';
import 'package:zschedule/pages/grounds.dart';

import 'pages/bookings.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('ZScedule'),
              bottom: const TabBar(
                  tabs: [Tab(text: 'Bookings'), Tab(text: 'Grounds')]),
            ),
            body: const TabBarView(children: [BookingsPage(), GroundsPage()])));
  }
}
