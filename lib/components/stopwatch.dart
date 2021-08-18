import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/stopwatch_button.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) {
        return Container(
          color: store.isWork() ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                store.isWork() ? 'Hora de Trabalhar' : 'Hora de Descansar',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.start)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: StopWatchButton(
                        text: 'Iniciar',
                        icon: Icons.play_arrow,
                        click: store.started,
                      ),
                    ),
                  if (store.start)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: StopWatchButton(
                        text: 'Parar',
                        icon: Icons.stop,
                        click: store.stop,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: StopWatchButton(
                      text: 'Reiniciar',
                      icon: Icons.refresh,
                      click: store.restart,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
