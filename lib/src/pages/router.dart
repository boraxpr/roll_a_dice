import 'package:flutter/material.dart';
import 'dice_page.dart';
import 'coin_page.dart';

class AppRoute {
  static const dice = 'dice';
  static const coin = 'coin';

  static get all => <String, WidgetBuilder>{
        dice: (context) => const DicePage(),
        coin: (context) => const CoinPage(),
      };
}
