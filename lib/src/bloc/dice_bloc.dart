import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(DiceState()) {
    on<DiceRollEvent>((event, emit) async {
      emit(state.copyWith(status: FetchStatus.rolling, diceFace: 1));
      await Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
      // Roll the dice
      emit(
        state.copyWith(
          status: FetchStatus.done,
          diceFace: 1 + Random().nextInt(6),
        ),
      );
    });
  }
}
