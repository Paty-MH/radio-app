// widgets/app_drawer.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          const Text(
            'Radioactiva Tx',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            '¡La Radio Alternativa!',
            style: TextStyle(color: Colors.grey),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Comparte con un amigo'),
            onTap: () {
              // TODO: implementar compartir
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('¡Califica nuestra app!'),
            onTap: () {
              // TODO: abrir enlace de calificación
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Nuestra Misión'),
            onTap: () {
              // TODO: mostrar misión
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Política de Privacidad'),
            onTap: () {
              // TODO: abrir enlace
            },
          ),
          ListTile(
            leading: const Icon(Icons.radio),
            title: const Text('Escúchanos en...'),
            onTap: () {
              // TODO: mostrar opciones externas
            },
          ),
          const SizedBox(height: 20),
          const Text('Versión 1.0.0', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
