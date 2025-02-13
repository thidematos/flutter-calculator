import 'package:calculator/widgets/keyboard/key_button.dart';
import 'package:flutter/material.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow(this.iterator, {super.key});

  final List<String> iterator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final key in iterator) KeyButton(key),
      ],
    );
  }
}
