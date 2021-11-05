import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class TraitWidget extends StatelessWidget {
  const TraitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
            //Title
            Text("Personality Traits",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("-Friendly"),
                Text("-Extrovert"),
                Text("-Observational"),
                Text("-Patient"),
                Text("-Outgoing"),
              ],
            ),
            RadarChart(
              maxValue: 10,
              values: const [1, 2, 3, 4, 6],
              labels: const [
                "Openness",
                "Conscientiousness",
                "Extroversion",
                "Agreeableness",
                "Neuroticism"
              ],
              fillColor: Colors.lightGreen,
              maxHeight: 150,
            )
          ])
        ]));
  }
}
