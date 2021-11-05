import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class TraitWidget extends StatelessWidget {
  const TraitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightGreen,width: 3)
        ),
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
              values: const [6,4,6,8,2],
              labels: const [
                "Openness",
                "Conscientiousness",
                "Extroversion",
                "Agreeableness",
                "Neuroticism"
              ],
              textScaleFactor: 0.06,
              fillColor: Colors.lightGreen,
              maxHeight: 150,
            )
          ])
        ]));
  }
}
