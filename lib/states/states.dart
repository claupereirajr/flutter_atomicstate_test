import 'package:rx_notifier/rx_notifier.dart';

// state/atoms
final counterState = RxNotifier(0);

// action
final incrementAction = RxNotifier.action();
final decrementAction = RxNotifier.action();
