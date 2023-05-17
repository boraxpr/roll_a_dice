import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(DiceState()) {
    on<DiceRollEvent>(
      (event, emit) async {
        List<int> dices = [0, 1, 2, 3, 4, 5];
        dices.shuffle();
        int time = 150;
        emit(
          state.copyWith(status: FetchStatus.rolling),
        );
        for (int i = 0; i < dices.length; i++) {
          await Future.delayed(Duration(milliseconds: time += 50));
          emit(
            state.copyWith(status: FetchStatus.rolling, diceFace: dices[i]),
          );
        }
        emit(
          state.copyWith(status: FetchStatus.done, diceFace: dices.last),
        );
      },
    );
  }
}
