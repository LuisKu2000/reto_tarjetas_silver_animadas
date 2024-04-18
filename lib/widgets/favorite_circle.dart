import 'package:flutter/material.dart';  // Importa la librería básica de Flutter.

// Widget que muestra un círculo de favorito que se anima basado en un porcentaje.
class FavoriteCircle extends StatelessWidget {
  const FavoriteCircle({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;      // Tamaño del widget.
  final double percent; // Porcentaje de desplazamiento en el scroll.

  @override
  Widget build(BuildContext context) {
    // Posiciona el círculo en la parte inferior derecha de la pantalla.
    return Positioned(
      bottom: size.height * 0.10, // Posición vertical.
      right: 10,                   // Posición horizontal.
      child: percent < 0.2 // Condición para mostrar o no el círculo.
          ? TweenAnimationBuilder<double>(
              // Animación de escala basada en el porcentaje de desplazamiento.
              tween: percent < 0.17 // Define el rango de animación.
                  ? Tween(begin: 1, end: 0)  // Escala de 1 a 0.
                  : Tween(begin: 0, end: 1), // Escala de 0 a 1.
              duration: const Duration(milliseconds: 300), // Duración de la animación.
              builder: (context, value, widget) {
                // Construye el widget transformado con la escala animada.
                return Transform.scale(
                  scale: 1.0 - value, // Escala final menos el valor animado.
                  child: CircleAvatar(
                    // Círculo de avatar.
                    minRadius: 20,                // Radio mínimo.
                    backgroundColor: Colors.red[300], // Color de fondo.
                    child: Icon(                  // Icono de favorito.
                      Icons.favorite,
                      color: Colors.red[900],   // Color del icono.
                    ),
                  ),
                );
              })
          : Container(), // Contenedor vacío si no se cumple la condición.
    );
  }
}
