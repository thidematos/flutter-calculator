import 'package:calculator/providers/display_provider.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:calculator/utils/error_handling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyButton extends ConsumerWidget {
  const KeyButton(this.keyLabel, {super.key});

  final String keyLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flexNum = keyLabel == 'C' || keyLabel == '0' ? 2 : 1;
    Color buttonColor = ColorTheme.ctaAccent;
    Color bgColor = ColorTheme.ctaBG;

    if (num.tryParse(keyLabel) != null || keyLabel == ',') {
      buttonColor = const Color.fromARGB(255, 142, 186, 208);
    }

    if (keyLabel == 'C') {
      buttonColor = ColorTheme.errorRed;
    }

    return Expanded(
      flex: flexNum,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
              color: const Color.fromARGB(255, 77, 77, 77), width: 0.5),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              ref.read(DisplayProvider.notifier).pressButton(keyLabel);
            },
            child: Text(
              keyLabel,
              style: LetterTheme.logo.copyWith(
                fontWeight: FontWeight.bold,
                color: buttonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
