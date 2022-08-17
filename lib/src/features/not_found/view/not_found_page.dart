import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotFoundPage extends HookConsumerWidget {
  const NotFoundPage({super.key});

  static const route = '/404';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '404',
            style: theme.textTheme.headline1,
          ),
          Text(
            'Not Found',
            style: theme.textTheme.headline3,
          ),

          // * Back button
          const SizedBox(height: 18),
          ElevatedButton(
            child: const Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
