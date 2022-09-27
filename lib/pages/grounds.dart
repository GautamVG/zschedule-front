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
      itemBuilder: (context, i) => GroundCard(grounds[i]),
    );
  }
}

class GroundCard extends StatelessWidget {
  final Ground ground;

  const GroundCard(this.ground, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Row(children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(ground.img),
          ),
          Expanded(child: Column(children: [Text(ground.name)]))
        ]),
      ),
    );
  }
}
