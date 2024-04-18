import 'dart:math';  // Importa la librería de matemáticas para operaciones como potencia.
import 'package:flutter/material.dart';  // Importa el framework Flutter.
import 'package:tarjetas_silver_app/widgets/custom_bottom_description.dart';  // Importa un widget personalizado.

// Widget que muestra datos con efectos de animación basados en el desplazamiento.
class DataCutRectangle extends StatelessWidget {
  const DataCutRectangle({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;      // Tamaño del widget.
  final double percent; // Porcentaje de desplazamiento en el scroll.

  @override
  Widget build(BuildContext context) {
    // Define el padding para posicionar el contenido.
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.34, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding para el título con animación basada en el desplazamiento.
          Padding(
            padding: EdgeInsets.only(
              left: percent > 0.13 // Condición para ajustar el padding lateral.
                  ? size.width * pow(percent, 5.5).clamp(0.0, 0.2)  // Aplica una transformación no lineal basada en el porcentaje.
                  : 0,  // Padding estándar si el porcentaje es menor o igual a 0.13.
              top: size.height * 
                  (percent > 0.48 // Condición para ajustar el padding superior.
                  ? pow(percent, 10.5).clamp(0.0, 0.06)  // Aplica una transformación no lineal basada en el porcentaje.
                  : 0.0)),  // Padding estándar si el porcentaje es menor o igual a 0.48.
            child: const Text(
              'Boku no Hero Academia',  // Título del dato.
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),  // Estilo del texto.
              textAlign: TextAlign.start,  // Alineación del texto.
            ),
          ),
          // Widget personalizado para descripciones animadas.
          if (percent < 0.50) ...[
            const SizedBox(
              height: 2,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),  // Duración de la animación.
              opacity: 1 - percent.clamp(0.0, 1.0),  // Opacidad basada en el porcentaje.
              child: const CustomBottomDescription(),  // Widget personalizado de descripción inferior.
            )
          ]
        ],
      ),
    );
  }
}
