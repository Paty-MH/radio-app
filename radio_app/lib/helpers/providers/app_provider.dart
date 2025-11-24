// helpers/providers/app_provider.dart
import 'package:flutter/foundation.dart';
import '../../models/station_model.dart';
import '../../models/program_model.dart';

class AppProvider extends ChangeNotifier {
  final List<StationModel> stations;
  final List<ProgramModel> programs;

  AppProvider({required this.stations, required this.programs});

  List<ProgramModel> programsByStation(String stationId) {
    return programs.where((p) => p.stationId == stationId).toList();
  }
}
