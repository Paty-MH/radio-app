// services/audio_service.dart
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

class AudioService {
  final player = AudioPlayer();

  Future<void> init() async {
    try {
      final session = await AudioSession.instance;

      // 🔥 Previene crash de audio_session
      await session.configure(const AudioSessionConfiguration.music());
    } catch (e) {
      print("Error configurando AudioSession: $e");
    }
  }

  Future<void> dispose() async {
    await player.dispose();
  }
}
