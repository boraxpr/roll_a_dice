part of 'dice_bloc.dart';

abstract class DiceEvent extends Equatable {
  const DiceEvent();

  @override
  List<Object> get props => [];
}

class DiceRollEvent extends DiceEvent {}
