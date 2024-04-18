// Importación de los paquetes necesarios de Flutter y otros módulos.
import 'package:flutter/material.dart'; // Importa el paquete de Material Design, que es una biblioteca de componentes UI para Flutter.
import 'package:flutter/services.dart'; // Importa utilidades para interactuar con las APIs de servicios del sistema, como controlar los modos de la UI.
import 'package:tarjetas_silver_app/widgets/home_challenge_sliver.dart'; // Importa un widget personalizado definido en el proyecto.
import 'package:tarjetas_silver_app/widgets/theme.dart'; // Importa la configuración de tema personalizada definida en el proyecto.

// Función principal que ejecuta la aplicación.
void main() {
  runApp(
      const MyApp()); // Inicializa y ejecuta la aplicación usando el widget MyApp como raíz.
}

// Definición de la clase MyApp, que es un widget sin estado.
class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // Constructor de la clase, opcionalmente recibe una clave.

  // Método build que construye el widget que este StatelessWidget representa.
  @override
  Widget build(BuildContext context) {
    // Configura el modo de la interfaz de usuario del sistema para que no muestre superposiciones del sistema (como la barra de estado y la barra de navegación).
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    // Retorna un widget MaterialApp, que es un contenedor conveniente para aplicaciones que usan Material Design.
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Deshabilita la etiqueta de "debug" en la esquina superior derecha.
      title:
          'Boku no Hero', // Título de la aplicación usado en el selector de tareas.
      theme: theme, // Aplica el tema personalizado definido en 'theme.dart'.
      home:
          const HomeSliverChallenge(), // Establece el widget inicial que se mostrará en la pantalla.
    );
  }
}
