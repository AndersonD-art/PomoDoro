import 'package:flutter/material.dart';
import 'package:pomodoro/components/input_time.dart';
import 'package:pomodoro/components/stopwatch.dart';

class PomoDoro extends StatelessWidget {
  const PomoDoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StopWatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputTime(
                  value: 25,
                  title: 'Trabalho',
                ),
                InputTime(
                  value: 5,
                  title: 'Descanso',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
