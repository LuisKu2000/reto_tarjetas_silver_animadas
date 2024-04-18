import 'package:flutter/material.dart';  // Importa el framework Flutter.

// Widget que muestra una imagen de fondo para el SliverAppBar.
class BackgroundSliver extends StatelessWidget {
  const BackgroundSliver({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna un widget posicionado que muestra una imagen de fondo.
    return const Positioned(
      left: 0,      // Posición a la izquierda.
      right: 0,     // Posición a la derecha.
      bottom: 0,    // Posición en la parte inferior.
      top: 0,       // Posición en la parte superior.
      child: Image(
        image: AssetImage(
          'assets/sliver/bnh.gif',  // Ruta de la imagen.
        ),
        fit: BoxFit.cover,  // Ajusta la imagen para cubrir el espacio disponible.
      ),
    );
  }
}
