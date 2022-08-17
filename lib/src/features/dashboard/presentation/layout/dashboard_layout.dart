import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardLayout extends ConsumerWidget {
  const DashboardLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Column(
        children: <Widget>[
          const Center(
            child: Text(
              'Dashboard',
            ),
          ),

          // * Content
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
