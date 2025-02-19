import 'package:bloc/bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(numberValue: 0));

  void increaseNumber({int newValue = 0}) {
    emit(state.copyWith(numberValue: state.numberValue! + newValue));
  }

  void decreaseNumber({int newValue = 0}) {
    emit(state.copyWith(numberValue: state.numberValue! - newValue));
  }

  void reset() {
    emit(state.reset());
  }
}
