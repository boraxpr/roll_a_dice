import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_a_dice/src/pages/router.dart';

import '../bloc/dice_bloc.dart';

Set<String> dices = {'⚀', '⚁', '⚂', '⚃', '⚄', '⚅'};

class DicePage extends StatelessWidget {
  const DicePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      //Dice
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<DiceBloc, DiceState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //Perfect Square button with text in the center
                          fixedSize: const Size.square(200),
                          backgroundColor: state.status == FetchStatus.done
                              ? Colors.black
                              : Colors.primaries[Random().nextInt(
                                  Colors.primaries.length - 1,
                                )] //randomize color
                          ,
                        ),
                        onPressed: () {
                          context.read<DiceBloc>().add(DiceRollEvent());
                        },
                        child: Text(
                          dices.elementAt(state.diceFace),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 150,
                          ),
                          maxLines: 1,
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

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.pushNamed(context, AppRoute.dice),
            title: const Text('Dice'),
            leading: const Icon(Icons.casino),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, AppRoute.coin),
            title: const Text('Coin'),
            leading: const Icon(Icons.monetization_on),
          ),
        ],
      ),
    );
  }
}
