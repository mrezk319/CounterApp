import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int? numberValue;

  const CounterState({this.numberValue});

  CounterState copyWith({int? numberValue}) {
    return CounterState(numberValue: numberValue ?? this.numberValue);
  }

  CounterState reset() {
    return const CounterState(numberValue: 0);
  }

  @override
  List<Object?> get props => [numberValue];
}
