import 'package:data_extractor/src/features/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterPage extends StatefulHookConsumerWidget {
  const CounterPage({
    super.key,
    required this.base,
  });

  final String base;

  static const String route = '/counter';

  @override
  ConsumerState<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends ConsumerState<CounterPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final base = int.tryParse(widget.base) ?? 0;
      ref.read(counterProvider.notifier).setBase = base;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final count = ref.watch(counterProvider);

            return Text(
              '$count',
              style: theme.textTheme.headline1?.copyWith(
                color: Colors.white,
              ),
            );
          },
        ),

        // *
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => ref.read(counterProvider.notifier).decrement(),
              child: const Text('Decrement'),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () => ref.read(counterProvider.notifier).increment(),
              child: const Text('Increment'),
            ),
          ],
        ),
      ],
    );
  }
}
