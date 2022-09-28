import 'package:flutter/material.dart';

// Models
import '../models/ground.dart';

final grounds = <Ground>[
  Ground("Ground 1"),
  Ground("Ground 2"),
  Ground("Ground 3"),
  Ground("Ground 4"),
  Ground("Ground 5"),
];

class GroundsPage extends StatelessWidget {
  const GroundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: grounds.length,
      itemBuilder: (context, i) => GroundCard(grounds[i]),
    );
  }
}

class GroundCard extends StatelessWidget {
  final Ground ground;

  const GroundCard(this.ground, {super.key});

  Widget buildGroundDetailsDialog(BuildContext context) {
    Map<String, List<String>> items = {
      "Equipments": ground.equipments
    };

    return AlertDialog(
      title: const Text("Ground Details"),
      content: SizedBox(
        width: double.maxFinite,
        height: 200,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            String sectionName = items.keys.elementAt(i);
            Iterable<Widget> sectionItems = items.values.elementAt(i)
              .map((item) => 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                )
              );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    sectionName,
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                ),
                ...sectionItems
              ]
            );
          }
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(ground.img),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ground.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Incharge: ${ground.incharge}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        child: const Padding(
                          padding: EdgeInsets.all(18),
                          child: Text("Show Details"),
                        ),
                        onPressed: () {
                          showDialog(context: context, builder: buildGroundDetailsDialog);
                        }, 
                      )
                    ],
                  )
                ]
              )
            )
          ]
        ),
      ),
    );
  }
}