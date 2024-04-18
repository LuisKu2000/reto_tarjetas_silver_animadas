import 'package:flutter/material.dart';  // Importa el framework Flutter.

// Widget que muestra una foto de portada con una imagen ajustada.
class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    super.key,
    required this.size,
  });

  final Size size;  // Tamaño del widget.

  @override
  Widget build(BuildContext context) {
    // Retorna un contenedor con una imagen ajustada y bordes redondeados.
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),  // Bordes redondeados.
      ),
      width: size.width * 0.27,  // Ancho del contenedor.
      height: size.height * 0.18,  // Alto del contenedor.
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),  // Bordes redondeados para la imagen.
        child: Image.asset(
          'assets/sliver/b1.jpg',  // Ruta de la imagen.
          fit: BoxFit.fill,  // Ajuste de la imagen.
        ),
      ),
    );
  }
}
