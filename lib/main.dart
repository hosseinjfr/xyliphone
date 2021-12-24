import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: TextButton(
              child: const Text(
                'Click Me'
              ),
              onPressed: () async {
                // AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
                // await audioPlayer.play('note1.wav' , isLocal: true);

                AudioCache audioCache = AudioCache();

                final file = await audioCache.loadAsFile('note1.wav');
                final bytes = await file.readAsBytes();
                audioCache.playBytes(bytes);
              },
            ),
          ),
        ),
      ),
    );
  }
}

