import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    AudioCache audioCache = AudioCache();

    void playSound(int soundNumber) async{
      final file = await audioCache.loadAsFile('note$soundNumber.wav');
      final bytes = await file.readAsBytes();
      audioCache.playBytes(bytes);
    }

    Expanded buildKey({required Color color , required int soundNumber}){
      return Expanded(
        child: TextButton(
          child: const Text(
              ''
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red , soundNumber: 1),
              buildKey(color: Colors.orange , soundNumber: 2),
              buildKey(color: Colors.green , soundNumber: 3),
              buildKey(color: Colors.blue , soundNumber: 4),
              buildKey(color: Colors.yellow , soundNumber: 5),
              buildKey(color: Colors.blueAccent , soundNumber: 6),
              buildKey(color: Colors.redAccent , soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}

