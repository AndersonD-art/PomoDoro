import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/input_time.dart';
import 'package:pomodoro/components/stopwatch.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class PomoDoro extends StatelessWidget {
  const PomoDoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StopWatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTime(
                    value: store.timeWork,
                    title: 'Trabalho',
                    inc: store.incrementTimeWork,
                    dec: store.decrementTimeWork,
                  ),
                  InputTime(
                    value: store.timeRest,
                    title: 'Descanso',
                    inc: store.incrementTimeRest,
                    dec: store.decrementTimeRest,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
