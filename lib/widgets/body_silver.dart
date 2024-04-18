import 'package:flutter/material.dart';  // Importa el framework Flutter.
import 'package:tarjetas_silver_app/widgets/theme.dart';  // Importa el tema personalizado.

// Widget que representa el cuerpo principal de la pantalla.
class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.size,
  });

  final Size size;  // Tamaño del widget.

  @override
  Widget build(BuildContext context) {
    // Retorna un contenedor con contenido variado.
    return Container(
      padding: const EdgeInsets.only(top: 10),  // Espaciado superior.
      color: backgroundcolor,  // Color de fondo.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  // Alineación a la izquierda.
        children: [
          // Fila con iconos personalizados y texto.
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomIcon(
                icon: Icons.stars,
                text: '95%',
              ),
              _CustomIcon(
                icon: Icons.tv,
                text: 'Netflix',
              ),
              _CustomIcon(
                icon: Icons.wc,
                text: 'Tv +14',
              ),
              _CustomIcon(
                icon: Icons.av_timer_rounded,
                text: '50m'
              )
            ],
          ),
          // Texto descriptivo principal.
          const Padding(
            padding: EdgeInsets.all(15.0),
            child:  Text(
              'Es la historia de un joven llamado Izuku Midoriya, su mayor sueño es convertirse en un heroe como su heroe favorito, el gran All Might, para lograrlo deberá pasar varios obstaculos, con ayuda de All Might logrará convertirse en un gran heroe',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 23),
            ),
          ),
          // Título para shows relacionados.
          const Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 10),
            child: Text(
              'Related shows',
              style: TextStyle(fontSize: 23),
            ),
          ),
          // Scroll horizontal para imágenes de shows relacionados.
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      height: size.height * 0.18,
                      width: size.width * 0.23,
                      image: AssetImage(
                        'assets/sliver/img${index + 1}.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ))),
          ),
          const SizedBox(
            height: 15,
          ),
          // Título para temporadas.
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Seansons',
              style: TextStyle(fontSize: 23),
            ),
          ),
          // Características de las temporadas.
          _Features(
            size: size,
            title: 'Seanson 1',
            subtitle: '8 watched',
            colorline: Colors.red,
          ),
          _Features(
            size: size,
            title: 'Seanson 2',
            subtitle: '9 watched',
            colorline: Colors.red,
          ),
          _Features(
            size: size,
            title: 'Seanson 3',
            subtitle: '1 to air',
            colorline: Colors.grey,
          ),
          _Features(
            size: size,
            title: 'Specials',
            subtitle: '7 to watch',
            colorline: Colors.grey,
          ),
        ],
      ),
    );
  }
}

// Widget para iconos personalizados.
class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;  // Icono a mostrar.
  final String text;    // Texto asociado al icono.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,  // Color del ícono.
          size: 45,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}

// Widget para mostrar características de las temporadas.
class _Features extends StatelessWidget {
  const _Features({
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.colorline,
  });

  final Size size;      // Tamaño del widget.
  final String title;   // Título de la temporada.
  final String subtitle;// Subtítulo con detalles.
  final Color colorline;// Color de la línea de progreso.

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),  // Espaciado interno.
      width: size.width,                  // Ancho total.
      color: backgroundcolor,             // Color de fondo.
      height: 100,                        // Altura fija.
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 5,
                    color: colorline,  // Color de la línea.
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.pending,
            color: Colors.grey[400],  // Color del ícono.
          )
        ],
      ),
    );
  }
}
