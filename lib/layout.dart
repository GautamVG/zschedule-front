import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:zschedule/pages/grounds.dart';
import 'pages/bookings.dart';

import 'models/ground.dart';

final grounds = <Ground>[
  Ground("Ground 1"),
  Ground("Ground 2"),
  Ground("Ground 3"),
  Ground("Ground 4"),
  Ground("Ground 5"),
];

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  Widget buildSlotBookingDialog(BuildContext context) {
    return const SlotBookingDialog();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ZSchedule'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(PhosphorIcons.signOut)
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Bookings'), 
              Tab(text: 'Grounds')
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            BookingsPage(),
            GroundsPage()
          ]
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(PhosphorIcons.plus),
          onPressed: () {
            showDialog(
              context: context,
              builder: buildSlotBookingDialog
            );
          },
        ),
      )
    );
  }
}

class SlotBookingDialog extends StatefulWidget {
  const SlotBookingDialog({super.key});

  @override
  State<SlotBookingDialog> createState() => _SlotBookingDialogState();
}

class _SlotBookingDialogState extends State<SlotBookingDialog> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController startTimeTextController = TextEditingController();
  final TextEditingController endTimeTextController = TextEditingController();

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  String selectedGroundName = grounds.first.name;

  @override
  Widget build(BuildContext context) {
    startTimeTextController.text = startTime.format(context);
    endTimeTextController.text = endTime.format(context);
    return AlertDialog(
      title: const Text("Book a slot"),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: "Pick a ground",
                  icon: Icon(PhosphorIcons.mapPin)
                ),
                value: selectedGroundName,
                items: grounds.map((Ground ground) {
                  return DropdownMenuItem(
                    value: ground.name,
                    child: Text(ground.name)
                  );
                }).toList(),
                onChanged: (String? newSelectedGroundName) {
                  if (newSelectedGroundName != null) {
                    setState(() {
                      selectedGroundName = newSelectedGroundName;
                    });
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Start Time",
                  icon: Icon(PhosphorIcons.clock)
                ),
                readOnly: true,
                controller: startTimeTextController,
                onTap: () async {
                  TimeOfDay? newSelectedTime = await showTimePicker(context: context, initialTime: startTime);
                  if (newSelectedTime != null) {
                    setState(() {
                      startTime = newSelectedTime;
                    });
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Start Time",
                  icon: Icon(PhosphorIcons.clock)
                ),
                readOnly: true,
                controller: endTimeTextController,
                onTap: () async {
                  TimeOfDay? newSelectedTime = await showTimePicker(context: context, initialTime: endTime);
                  if (newSelectedTime != null) {
                    setState(() {
                      endTime = newSelectedTime;
                    });
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {Navigator.pop(context);}, 
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Book"),
                ),
              )
            ]
          )
        ),
      )
    );
  }
}