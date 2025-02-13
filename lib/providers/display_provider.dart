import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialState = {
  'operation': '',
  'display': [],
  'buffer': [],
  'currentNumbers': [],
  'prevOperation': '',
};

class DisplayNotifier extends StateNotifier<Map<String, dynamic>> {
  DisplayNotifier() : super(initialState);

  addToDisplay(pressed) {
    final isNum = num.tryParse(pressed);

    if (pressed == 'C') {
      state = initialState;

      return true;
    }

    if (state['display'].length == 15) {
      return false;
    }

    if (isNum == null) {
      state = {
        ...state,
        'operation': pressed,
        'buffer': [],
        'prevOperation':
            state['operation'].isEmpty ? pressed : state['operation'],
        'currentNumbers': [
          ...state['currentNumbers'],
          num.parse(state['buffer'].join(''))
        ]
      };
    }

    state = {
      ...state,
      'buffer':
          isNum != null ? [...state['buffer'], pressed] : [...state['buffer']],
      "display": [...state['display'], pressed],
    };

    return true;
  }
}

final DisplayProvider = StateNotifierProvider((ref) => DisplayNotifier());
