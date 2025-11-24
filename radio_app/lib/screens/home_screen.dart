import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../helpers/providers/audio_provider.dart';
import '../helpers/providers/app_provider.dart';
import '../widgets/station_card.dart';
import '../widgets/program_carousel.dart';
import '../models/program_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openProgramDetail(BuildContext context, ProgramModel program) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(program.imageAsset, height: 100),
              const SizedBox(height: 12),
              Text(
                program.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('Con ${program.host}'),
              const SizedBox(height: 8),
              Text(program.description),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final audio = context.watch<AudioProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Radioactiva Tx')),
      drawer: Drawer(
        child: Container(
          color: Colors.yellow.shade700,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "R Tx",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("¡La Radio Alternativa!"),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text("Comparte con un amigo"),
                onTap: () => launchUrlString("https://radioactivatx.com"),
              ),
              ListTile(
                leading: const Icon(Icons.star_rate),
                title: const Text("¡Califica nuestra app!"),
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text("Nuestra Misión"),
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text("Política de Privacidad"),
              ),
              ListTile(
                leading: const Icon(Icons.radio),
                title: const Text("Escúchanos en"),
                onTap: () => launchUrlString("https://www.radioactivatx.org"),
              ),
              const Divider(),
              const ListTile(title: Text("Versión 1.1.8")),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Estaciones', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...app.stations.map(
              (s) => StationCard(
                station: s,
                onTap: () async {
                  await audio.play(s);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Reproduciendo ${s.name}')),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text('Programas', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ProgramCarousel(
              programs: audio.currentStation == null
                  ? app.programs
                  : app.programsByStation(audio.currentStation!.id),
              onProgramTap: (p) => _openProgramDetail(context, p),
            ),
          ],
        ),
      ),
      bottomNavigationBar: audio.currentStation == null
          ? null
          : Container(
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Image.asset(
                    audio.currentStation!.imageAsset,
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          audio.currentStation!.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (audio.nowTitle != null)
                          Text(
                            audio.nowTitle!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      audio.isPlaying ? Icons.pause_circle : Icons.play_circle,
                      size: 32,
                    ),
                    onPressed: () =>
                        audio.isPlaying ? audio.pause() : audio.resume(),
                  ),
                ],
              ),
            ),
    );
  }
}
