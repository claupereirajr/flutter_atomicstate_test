import 'package:flutter_atomicstate_test/states/states.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CounterReducer extends RxReducer {
  CounterReducer() {
    on(() => [incrementAction.value], addCounter);
    on(() => [decrementAction.value], subCounter);
  }

  void addCounter() {
    counterState.value++;
  }

  void subCounter() {
    counterState.value--;
  }
}
