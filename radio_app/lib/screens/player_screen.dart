import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/providers/audio_provider.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = context.watch<AudioProvider>();
    final station = audio.currentStation;

    if (station == null) {
      return const Scaffold(
        body: Center(child: Text("No hay estación seleccionada")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(station.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(station.imageAsset, height: 180),
            ),
            const SizedBox(height: 20),
            if (audio.nowTitle != null)
              Text(audio.nowTitle!,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center),
            const SizedBox(height: 40),
            IconButton(
              iconSize: 64,
              icon: Icon(
                  audio.isPlaying ? Icons.pause_circle : Icons.play_circle),
              onPressed: () => audio.isPlaying ? audio.pause() : audio.resume(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
