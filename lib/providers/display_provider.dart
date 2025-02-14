import 'package:calculator/services/cloud_store_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final operations = ['%', '÷', 'x', '-', '+', '='];

final initialValue = {
  'value': '0',
  'buffer': [0.0, 0.0],
  'bufferIndex': 0,
  'curOperation': null,
  'wipe': false,
};

class DisplayNotifier extends StateNotifier {
  DisplayNotifier() : super(initialValue);

  _clear() {
    state = initialValue;
  }

  _applyCommand(pressed) {
    if (pressed == 'C') {
      _clear();
      return;
    }

    if (operations.contains(pressed)) {
      _setOperation(pressed);
      return;
    }

    _addDigit(pressed);
  }

  _addDigit(digit) {
    final isDot = digit == '.';

    final wipeValue = (state['value'] == '0' && !isDot) || state['wipe'];

    if (isDot && state['value'].contains('.') && !wipeValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    var currentValue = wipeValue ? emptyValue : state['value'];
    currentValue = currentValue + digit;

    final buffer = state['buffer'];

    buffer[state['bufferIndex']] = double.tryParse(currentValue) ?? 0;

    state = {...state, 'value': currentValue, 'wipe': false, 'buffer': buffer};
  }

  _setOperation(operation) {
    var buffer = state['buffer'];

    if (state['bufferIndex'] == 0) {
      state = {
        ...state,
        'operation': operation,
        'bufferIndex': 1,
      };
    } else {
      buffer[0] = _calculate();
      buffer[1] = 0.0;
      state = {
        ...state,
        'value': buffer[0].toString().endsWith('.0')
            ? buffer[0].toString().split('.')[0]
            : buffer[0].toString(),
        'buffer': buffer,
      };
      bool isEqualSign = operation == '=';
      if (isEqualSign) {
        CloudStoreApi.setHistory(state['value']);
      }
      state = {
        ...state,
        'operation': isEqualSign ? null : operation,
        'bufferIndex': isEqualSign ? 0 : 1
      };
    }

    state = {
      ...state,
      'wipe': true,
    };
  }

  _calculate() {
    switch (state['operation']) {
      case '%':
        return state['buffer'][0] % state['buffer'][1];
      case '÷':
        return state['buffer'][0] / state['buffer'][1];
      case 'x':
        return state['buffer'][0] * state['buffer'][1];
      case '+':
        return state['buffer'][0] + state['buffer'][1];
      case '-':
        return state['buffer'][0] - state['buffer'][1];

      default:
        return state['buffer'][0];
    }
  }

  pressButton(pressed) {
    _applyCommand(pressed);
  }
}

final DisplayProvider = StateNotifierProvider((ref) => DisplayNotifier());
