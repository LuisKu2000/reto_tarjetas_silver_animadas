import 'package:flutter/material.dart';  // Importa el framework Flutter.

// Widget que muestra una descripción personalizada en la parte inferior.
class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna una columna que contiene dos textos descriptivos.
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,  // Alineación de los elementos a la izquierda.
      children: [
        // Texto con géneros y categorías del anime.
        Text(
          'Anime, Acción, drama, escolar, shonen, superhéroes',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),  // Estilo del texto.
        ),
        SizedBox(
          height: 2,  // Espacio vertical entre los textos.
        ),
        // Texto adicional para categoría de ciencia ficción.
        Text(
          'Ciencia ficción',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),  // Estilo del texto.
        )
      ],
    );
  }
}
