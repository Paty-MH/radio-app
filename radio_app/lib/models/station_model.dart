// models/station_model.dart
class StationModel {
  final String id;
  final String name;
  final String acronym;
  final String streamUrl;
  final String imageAsset;
  final String slogan;
  final List<String> socialLinks;
  final String description;

  const StationModel({
    required this.id,
    required this.name,
    required this.acronym,
    required this.streamUrl,
    required this.imageAsset,
    required this.slogan,
    required this.socialLinks,
    required this.description,
  });
}
