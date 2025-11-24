// helpers/providers/audio_provider.dart
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import '../../models/station_model.dart';
import '../../services/audio_service.dart';

class AudioProvider extends ChangeNotifier {
  final AudioService audioService;
  StationModel? _currentStation;
  String? _nowTitle;
  bool _isPlaying = false;

  AudioProvider(this.audioService) {
    audioService.player.icyMetadataStream.listen((metadata) {
      final title = metadata?.info?.title;
      if (title != null && title.isNotEmpty) {
        _nowTitle = title;
        notifyListeners();
      }
    });

    audioService.player.playingStream.listen((playing) {
      _isPlaying = playing;
      notifyListeners();
    });
  }

  StationModel? get currentStation => _currentStation;
  String? get nowTitle => _nowTitle;
  bool get isPlaying => _isPlaying;

  Future<void> play(StationModel station) async {
    try {
      _currentStation = station;
      _nowTitle = null;

      await audioService.player.setAudioSource(
        AudioSource.uri(
          Uri.parse(station.streamUrl),
          tag: MediaItem(
            id: station.id,
            album: station.acronym,
            title: station.name,
            artUri: Uri.parse("https://www.radioactivatx.org/logo.png"),
          ),
        ),
        preload: true,
      );

      await audioService.player.play();
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      _isPlaying = false;
      notifyListeners();
      debugPrint('Error al reproducir: $e');
    }
  }

  Future<void> pause() async {
    await audioService.player.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> resume() async {
    await audioService.player.play();
    _isPlaying = true;
    notifyListeners();
  }

  Future<void> stop() async {
    await audioService.player.stop();
    _isPlaying = false;
    _currentStation = null;
    _nowTitle = null;
    notifyListeners();
  }

  Future<void> setStation(StationModel s) async {}
}
