import 'package:calculator/providers/display_provider.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Result extends ConsumerWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(DisplayProvider) as Map;
    final display = state['display'];
    final currentNumbers = state['currentNumbers'];
    final buffer = num.tryParse(state['buffer'].join('')) ?? 0;
    final operation = state['operation'] as String;

    var result;

    switch (state['operation']) {
      case '+':
        result = currentNumbers.reduce((acc, item) => acc + item) + buffer;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            result == null ? '' : result.toString(),
            style: LetterTheme.body.copyWith(
              fontSize: 28,
              color: ColorTheme.grey,
            ),
          ),
        )
      ],
    );
  }
}
