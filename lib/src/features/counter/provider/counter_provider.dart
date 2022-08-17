import 'package:hooks_riverpod/hooks_riverpod.dart';

// final counterProvider = StateProvider<int>((ref) => 0);

final counterProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;

  // ignore: avoid_setters_without_getters
  set setBase(int base) => state = base;
}
