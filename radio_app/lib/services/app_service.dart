// services/app_service.dart
import 'package:flutter/material.dart';
import 'audio_service.dart';

class AppService {
  final AudioService audioService;

  AppService({required this.audioService});

  /// Inicializa todos los servicios necesarios al arrancar la app
  Future<void> init() async {
    await audioService.init();
    debugPrint("✅ Servicios inicializados correctamente");
  }
}
