import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dice_bloc.dart';

Set<String> dices = {
  '⚀',
  '⚁',
  '⚂',
  '⚃',
  '⚄',
  '⚅',
};

class DicePage extends StatelessWidget {
  const DicePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Dice
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<DiceBloc, DiceState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            state.status == FetchStatus.done
                                ? Colors.black
                                : //randomize color
                                Colors.primaries[Random().nextInt(
                                    Colors.primaries.length - 1,
                                  )],
                          ),
                        ),
                        onPressed: state.status == FetchStatus.done
                            ? () =>
                                context.read<DiceBloc>().add(DiceRollEvent())
                            : null,
                        child: Text(
                          dices.elementAt(state.diceFace),
                          style: const TextStyle(
                            fontSize: 150,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
