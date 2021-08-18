import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  bool start = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int timeWork = 2;

  @observable
  int timeRest = 1;

  @action
  void started() {
    start = true;
  }

  @action
  void stop() {
    start = false;
  }

  @action
  void restart() {
    start = false;
  }

  @action
  void incrementTimeWork() {
    timeWork++;
  }

  @action
  void decrementTimeWork() {
    timeWork--;
  }

  @action
  void incrementTimeRest() {
    timeRest++;
  }

  @action
  void decrementTimeRest() {
    timeRest--;
  }
}
