part of 'dice_bloc.dart';

enum FetchStatus { rolling, done }

class DiceState extends Equatable {
  const DiceState({
    this.diceFace = 1,
    this.status = FetchStatus.done,
  });
  final int diceFace;
  final FetchStatus status;

  DiceState copyWith({
    int? diceFace,
    FetchStatus? status,
  }) {
    return DiceState(
      diceFace: diceFace ?? this.diceFace,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [diceFace];
}
