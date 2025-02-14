import 'package:calculator/providers/display_provider.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Display extends ConsumerWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final display = ref.watch(DisplayProvider) as Map;

    print(display);

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(
                  color: ColorTheme.borderBlack,
                  width: 1,
                ),
              ),
            ),
            child: Text(
              display['value'],
              style: LetterTheme.body.copyWith(
                fontSize: 72,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
