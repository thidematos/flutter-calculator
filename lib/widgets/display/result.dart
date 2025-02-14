import 'package:calculator/providers/display_provider.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Result extends ConsumerWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(DisplayProvider);

    final result = 'oi';

    final finalResult = 'oi';

    Widget textContent = Text(
      result,
      style: LetterTheme.body.copyWith(
        fontSize: 28,
        color: ColorTheme.grey,
      ),
    );

    if (finalResult.isNotEmpty) {
      textContent = Text(
        finalResult,
        style: LetterTheme.body.copyWith(
          fontSize: 28,
          color: ColorTheme.black,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: textContent,
        )
      ],
    );
  }
}
