import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_a_dice/src/bloc/dice_bloc.dart';
import 'package:roll_a_dice/src/pages/router.dart';
import 'pages/dice_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final diceBloc = BlocProvider<DiceBloc>(create: (context) => DiceBloc());
    return MultiBlocProvider(
      providers: [
        diceBloc,
      ],
      child: MaterialApp(
        title: 'Dice',
        routes: AppRoute.all,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DicePage(),
      ),
    );
  }
}
