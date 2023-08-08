import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomState<T> {
  final ProviderRef ref;
  final T initialValue;
  final StateProvider<T> provider;
  late T prevValue;

  CustomState(this.ref, this.initialValue)
      : provider = StateProvider<T>((ref) => initialValue),
        prevValue = initialValue;

  set state(T state) {
    if (prevValue == state) ref.invalidate(provider);
    ref.read(provider.notifier).state = state;
    prevValue = state;
  }

  T get state => ref.read(provider.notifier).state;
}
