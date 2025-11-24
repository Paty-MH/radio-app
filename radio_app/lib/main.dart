import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/player_screen.dart';
import 'helpers/providers/audio_provider.dart';
import 'helpers/providers/app_provider.dart';
import 'services/audio_service.dart';
import 'theme/app_theme.dart';
import 'helpers/constants.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> _initJustAudioBackground() async {
  try {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.radioapp.channel.audio',
      androidNotificationChannelName: 'Radio Playback',
      androidNotificationOngoing: true,
    );
  } catch (e) {
    print("Error inicializando just_audio_background: $e");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initJustAudioBackground();

  final audioService = AudioService();

  // 🔥 Corrección: evitar que audio_session bloquee la app
  try {
    await audioService.init();
  } catch (e) {
    print("Error inicializando audioService: $e");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioProvider(audioService)),
        ChangeNotifierProvider(
          create: (_) => AppProvider(stations: stations, programs: programs),
        ),
      ],
      child: const RadioApp(),
    ),
  );
}

class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radioactiva Tx',
      theme: appTheme,
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingScreen(),
        '/home': (_) => const HomeScreen(),
        '/player': (_) => const PlayerScreen(),
      },
    );
  }
}
