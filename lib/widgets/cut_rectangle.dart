import 'package:flutter/material.dart';  // Importa el framework Flutter.
import 'package:tarjetas_silver_app/widgets/theme.dart';  // Importa el tema personalizado.

// CustomPainter para dibujar un rectángulo recortado.
class CutRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define las propiedades de pintura.
    final paint = Paint();
    paint.color = backgroundcolor;  // Color de fondo definido en el tema.
    paint.style = PaintingStyle.fill;  // Estilo de pintura (relleno).
    paint.strokeWidth = 10;  // Grosor de la línea.

    // Define el camino del rectángulo recortado.
    final path = Path();
    path.moveTo(0, size.height);  // Mueve el lápiz al punto inicial en la parte inferior izquierda.
    path.lineTo(size.width, size.height);  // Dibuja una línea horizontal en la parte inferior.
    path.lineTo(size.width, 0);  // Dibuja una línea vertical en el lado derecho.
    path.lineTo(size.width * 0.27, 0);  // Dibuja una línea diagonal hasta un punto en el lado izquierdo.

    // Dibuja el camino en el canvas.
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;  // Indica si debe volver a pintarse el widget.
}
