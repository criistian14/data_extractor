import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _isHover = StateProvider.family<bool, String>((ref, id) => false);

class LinkText extends ConsumerWidget {
  const LinkText({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = ref.watch(_isHover(text).notifier);

    return GestureDetector(
      onTap: () => onTap?.call(),
      child: MouseRegion(
        onEnter: (_) => isHover.state = true,
        onExit: (_) => isHover.state = false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: Colors.grey[600],
              fontSize: 15,
              decoration: ref.watch(_isHover(text))
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
