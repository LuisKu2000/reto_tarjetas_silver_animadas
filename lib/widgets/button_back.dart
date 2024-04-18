import 'package:flutter/material.dart';  // Importa el framework Flutter.

// Widget que muestra un botón de retroceso con un ícono de flecha.
class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;      // Tamaño del widget.
  final double percent; // Porcentaje de desplazamiento en el scroll.

  @override
  Widget build(BuildContext context) {
    // Retorna un widget posicionado con un ícono de flecha de retroceso.
    return Positioned(
      top: size.height * 0.15,  // Posición vertical.
      left: 15,                  // Posición horizontal.
      child: Icon(
        Icons.arrow_back,  // Ícono de flecha de retroceso.
        size: 30,          // Tamaño del ícono.
        color: percent < 0.56  // Condición para cambiar el color del ícono basado en el porcentaje.
            ? Colors.white.withOpacity(1 - percent)  // Color blanco con opacidad variable.
            : Colors.black,  // Color negro si el porcentaje es mayor o igual a 0.56.
      ),
    );
  }
}
