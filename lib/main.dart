import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dicee',
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

//void _switchDice() {}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1, rightDiceNumber = 1;
  AudioCache player;

// A void method that doesn't takes an argument/parameter and doesn't return a result
  void _trySwitch() {
    setState(() {
      player.play('MOREDICE.wav');
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

// Using 'super' keyword to call the constructor of a base class buh in this case we used it to call the base method
  @override
  void initState() {
    super.initState();
    player = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  // An Expanded return type of method which returns an expanded widget with flat buttons
  Expanded createDice(int diceNumber) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          _trySwitch();
        },
        child: Image.asset('assets/images/dice$diceNumber.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          createDice(leftDiceNumber),
          createDice(rightDiceNumber)
        ],
      ),
    );
  }
}
