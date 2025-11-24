import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Muestra un SnackBar rápido en cualquier pantalla
void showSnack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

/// Abre una URL externa en el navegador
Future<void> openUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("No se pudo abrir la URL: $url");
  }
}

/// Formatea texto largo para que no se desborde
String truncateText(String text, {int maxLength = 50}) {
  if (text.length <= maxLength) return text;
  return '${text.substring(0, maxLength)}...';
}

/// Devuelve un estilo de título consistente
TextStyle appTitleStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      );
}
