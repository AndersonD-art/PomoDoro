import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TypeInterval { WORK, REST }

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

  @observable
  TypeInterval typeInterval = TypeInterval.WORK;

  Timer? stopwatch;

  @action
  void started() {
    start = true;
    stopwatch = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (minutes == 0 && seconds == 0) {
        _switchIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    start = false;
    stopwatch?.cancel();
  }

  @action
  void restart() {
    start = false;
    stop();
    minutes = isWork() ? timeWork : timeRest;
    seconds = 0;
  }

  @action
  void incrementTimeWork() {
    timeWork++;
    if (isWork()) {
      restart();
    }
  }

  @action
  void decrementTimeWork() {
    if (timeWork > 1) {
      timeWork--;
      if (isWork()) {
        restart();
      }
    }
  }

  @action
  void incrementTimeRest() {
    timeRest++;
    if (isRest()) {
      restart();
    }
  }

  @action
  void decrementTimeRest() {
    if (timeRest > 1) {
      timeRest--;
      if (isRest()) {
        restart();
      }
    }
  }

  bool isWork() {
    return typeInterval == TypeInterval.WORK;
  }

  bool isRest() {
    return typeInterval == TypeInterval.REST;
  }

  void _switchIntervalType() {
    if (isWork()) {
      typeInterval = TypeInterval.REST;
      minutes = timeRest;
    } else {
      typeInterval = TypeInterval.WORK;
      minutes = timeWork;
    }
    seconds = 0;
  }
}
