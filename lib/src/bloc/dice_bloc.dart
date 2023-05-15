import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/dice_page.dart';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(DiceState()) {
    on<DiceRollEvent>(
      (event, emit) async {
        List<int> dices = [0, 1, 2, 3, 4, 5];
        dices.shuffle();
        emit(
          state.copyWith(
            status: FetchStatus.done,
          ),
        );
        emit(
          state.copyWith(
            status: FetchStatus.rolling,
          ),
        );
        for (int i = 0; i < dices.length; i++) {
          await Future.delayed(const Duration(milliseconds: 100));
          if (i == dices.length - 1) {
            emit(
              state.copyWith(
                status: FetchStatus.done,
                diceFace: dices[i],
              ),
            );
            break;
          } else {
            emit(
              state.copyWith(
                status: FetchStatus.rolling,
                diceFace: dices[i],
              ),
            );
          }
        }
      },
    );
  }
}
