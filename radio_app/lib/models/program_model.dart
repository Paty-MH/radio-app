// models/program_model.dart
class ProgramModel {
  final String id;
  final String stationId;
  final String title;
  final String host;
  final String description;
  final String imageAsset;
  final DateTime startTime;
  final DateTime endTime;

  const ProgramModel({
    required this.id,
    required this.stationId,
    required this.title,
    required this.host,
    required this.description,
    required this.imageAsset,
    required this.startTime,
    required this.endTime,
  });
}
