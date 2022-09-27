import 'package:flutter/material.dart';

// Icons
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Models
import 'package:zschedule/models/ground.dart';
import 'package:zschedule/models/slot.dart';

final bookedSlots = <Slot>[
  Slot(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 2)),
      booker: "Harshal Dave",
      ground: Ground("Ground 1")),
  Slot(
      startTime: DateTime.now().add(const Duration(hours: 4)),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      booker: "Harshal Dave",
      ground: Ground("Ground 2")),
];

class BookingsPage extends StatelessWidget {
  static const int slotDurationMinutes = 30;
  static const int numberOfSlots = (60 ~/ slotDurationMinutes) * 24;

  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: numberOfSlots,
      itemBuilder: (context, index) {
        int slotIndex =
            bookedSlots.indexWhere((bookedSlot) => bookedSlot.contains(time));
        if (slotIndex == -1) {
          DateTime startTime = time;
          time = time.add(const Duration(minutes: slotDurationMinutes));
          return EmptySlot(startTime);
        } else {
          Slot slot = bookedSlots[slotIndex];
          time = slot.endTime;
          return BookedSlot(slot);
        }
      },
      separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8), child: Divider()),
    );
  }
}

class EmptySlot extends StatelessWidget {
  final DateTime startTime;

  const EmptySlot(this.startTime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(PhosphorIcons.clock),
                Column(children: [
                  Text(
                    "${startTime.hour}:${startTime.minute}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(startTime.hour > 12 ? 'PM' : 'AM'),
                ])
              ])
        ]));
  }
}

class BookedSlot extends StatelessWidget {
  final Slot slot;

  const BookedSlot(this.slot, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Icon(PhosphorIcons.clock),
              Column(children: [
                Text(
                  "${slot.startTime.hour}:${slot.startTime.minute}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(slot.startTime.hour > 12 ? 'PM' : 'AM'),
              ]),
              Column(
                children: [
                  Text(
                    "${slot.endTime.hour}:${slot.endTime.minute}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(slot.endTime.hour > 12 ? 'PM' : 'AM'),
                ]
              ),
            ]
          ),
          Column(
            children: [
              Text(
                "Booked by",
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                slot.booker,
                style: Theme.of(context).textTheme.labelLarge
              ),
            ]
          ),
          Text(
            slot.ground.name,
            style: Theme.of(context).textTheme.labelSmall
          )
        ]
      )
    );
  }
}
