import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dice_bloc.dart';

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Dice
      body: Center(
        child: BlocBuilder<DiceBloc, DiceState>(
          builder: (context, state) {
            return SizedBox(
              child: state.status == FetchStatus.rolling
                  ? _buildLoadingView()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<DiceBloc>().add(DiceRollEvent());
                          },
                          child: Text(
                            state.diceFace.toString(),
                            style: const TextStyle(fontSize: 100),
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  _buildLoadingView() => Container(
        alignment: Alignment.center,
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: CircularProgressIndicator(),
      );
}
