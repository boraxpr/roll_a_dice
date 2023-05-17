import 'package:flutter/material.dart';

import 'dice_page.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  @override
  Widget build(BuildContext context) {
    List<String> coin = [
      'Heads',
      'Tails',
    ];
    var flip = 0;
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
