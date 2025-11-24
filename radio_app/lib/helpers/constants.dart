// helpers/constants.dart
import '../models/station_model.dart';
import '../models/program_model.dart';

const stations = <StationModel>[
  StationModel(
    id: 'rtx',
    name: 'Radioactiva Tx',
    acronym: 'R Tx',
    streamUrl: 'https://stream.freepi.io:8010/stream',
    imageAsset: 'assets/images/station1.png',
    slogan: '¡La Radio Alternativa!',
    socialLinks: [
      'https://instagram.com/radioactivatx',
      'https://facebook.com/radioactivatx',
      'https://www.radioactivatx.org',
    ],
    description: 'La alternativa desde nuestras latitudes',
  ),
  StationModel(
    id: 'ljr',
    name: 'Live Jazz Radio',
    acronym: 'LJR',
    streamUrl: 'https://stream.freepi.io/8012/live',
    imageAsset: 'assets/images/station2.png',
    slogan: '¡Una sínfonía de nuestras latitudes!',
    socialLinks: [
      'https://instagram.com/livejazz',
      'https://twitter.com/livejazz',
    ],
    description: 'Jazz que respira contigo',
  ),
];

final programs = <ProgramModel>[
  ProgramModel(
    id: 'prog_1',
    stationId: 'ljr',
    title: 'Al Compás del Mundo',
    host: 'Jim Haas',
    imageAsset: 'assets/images/prog1.png',
    description: 'Vinilos, historias y una vuelta por el mundo del jazz.',
    startTime: DateTime(2025, 11, 20, 20, 0),
    endTime: DateTime(2025, 11, 20, 22, 0),
  ),
  ProgramModel(
    id: 'prog_2',
    stationId: 'rtx',
    title: 'Vagos de la Vida Real',
    host: 'Colectivo Radioactiva',
    imageAsset: 'assets/images/prog2.png',
    description: 'Conversaciones en blanco y negro, sin filtros.',
    startTime: DateTime(2025, 11, 20, 7, 0),
    endTime: DateTime(2025, 11, 20, 9, 0),
  ),
];
