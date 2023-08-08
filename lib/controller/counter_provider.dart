import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/models/custom_state_provider.dart';

final counterProviderScreen = Provider<_CounterLogic>(
      (ref) => _CounterLogic(ref: ref),
);

class _CounterLogic extends _CounterStates {
  _CounterLogic({required super.ref});

  void increment() {
    counter.state++;
  }

  void increment2() {
    counter2.state++;
  }

  void incrementAll() {
    counter.state++;
    counter2.state++;
  }
}

class _CounterStates {
  final ProviderRef ref;
  final CustomState<int> counter;
  final CustomState<int> counter2;


  _CounterStates({required this.ref})
      : counter = CustomState(ref, 0),
      counter2 = CustomState(ref, 0);
}

