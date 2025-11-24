// widgets/station_card.dart
import 'package:flutter/material.dart';
import '../models/station_model.dart';

class StationCard extends StatelessWidget {
  final StationModel station;
  final VoidCallback? onTap;

  const StationCard({super.key, required this.station, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(station.imageAsset,
              width: 48, height: 48, fit: BoxFit.cover),
        ),
        title: Text(station.name),
        subtitle: Text(
            station.slogan.isNotEmpty ? station.slogan : station.description),
        trailing: const Icon(Icons.play_arrow),
        onTap: onTap,
      ),
    );
  }
}
