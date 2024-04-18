import 'dart:math';  // Para operaciones matemáticas como la potencia.
import 'package:flutter/material.dart';  // Importa el framework Flutter.
// Importaciones de widgets personalizados usados en la aplicación.
import 'package:tarjetas_silver_app/widgets/background_silver.dart';
import 'package:tarjetas_silver_app/widgets/body_silver.dart';
import 'package:tarjetas_silver_app/widgets/button_back.dart';
import 'package:tarjetas_silver_app/widgets/cover_photo.dart';
import 'package:tarjetas_silver_app/widgets/cut_rectangle.dart';
import 'package:tarjetas_silver_app/widgets/data_cut_rectangle.dart';
import 'package:tarjetas_silver_app/widgets/favorite_circle.dart';

// Widget principal que define la página inicial con un comportamiento de scroll avanzado.
class HomeSliverChallenge extends StatefulWidget {
  const HomeSliverChallenge({super.key});

  @override
  State<HomeSliverChallenge> createState() => _HomeSliverChallengeState();
}

class _HomeSliverChallengeState extends State<HomeSliverChallenge> {
  @override
  Widget build(BuildContext context) {
    // Obtiene las dimensiones de la pantalla
    final size = MediaQuery.of(context).size;

    // Scaffold es la estructura básica de la página que contiene un CustomScrollView.
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Define un encabezado personalizado que se expande y colapsa.
          SliverPersistentHeader(
            delegate: _AppBarNetflix(
              minExtended: kToolbarHeight,
              maxExtended: size.height * 0.35,
              size: size,
            ),
          ),
          // Un adaptador para incorporar un widget que no es sliver dentro de un scroll sliver.
          SliverToBoxAdapter(
            child: Body(size: size),
          )
        ],
      ),
    );
  }
}

// Define el comportamiento del encabezado personalizado.
class _AppBarNetflix extends SliverPersistentHeaderDelegate {
  final double maxExtended;
  final double minExtended;
  final Size size;

  _AppBarNetflix({required this.maxExtended, required this.minExtended, required this.size});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Calcula el porcentaje de reducción del encabezado
    final percent = shrinkOffset / maxExtended;
    // Límite de ángulo para el efecto de rotación de la tarjeta
    final uploadlimit = 13 / 100; 
    // Controla el ángulo de regreso de la tarjeta
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);
    // Incrementa la rotación basada en el porcentaje de desplazamiento
    final fixrotation = pow(percent, 1.5);

    final card = _CoverCard(
      size: size,
      percent: percent,
      uploadlimit: uploadlimit,
      valueback: valueback,
    );

    final bottomsliverbar = _CustomBottomSliverBar(
      size: size,
      fixrotation: fixrotation,
      percent: percent,
    );

    // Estructura visual del encabezado, usando Stack para sobreponer elementos.
    return Container(
      child: Stack(
        children: [
          const BackgroundSliver(),
          if (percent > uploadlimit) ...[
            card,
            bottomsliverbar,
          ] else ...[
            bottomsliverbar,
            card,
          ],
          ButtonBack(size: size, percent: percent),
          FavoriteCircle(size: size, percent: percent),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtended;

  @override
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

// Widget que muestra una tarjeta con una foto de portada que rota basándose en el desplazamiento del scroll.
class _CoverCard extends StatelessWidget {
  const _CoverCard(
      {super.key,
      required this.size,
      required this.percent,
      required this.uploadlimit,
      required this.valueback});
  final Size size;
  final double percent;
  final double uploadlimit;
  final num valueback;

  final double angleForCard = 7.0;  // Ángulo fijo para la rotación de la tarjeta

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      left: size.width / 24,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()
          ..rotateZ(
            percent > uploadlimit
                ? (valueback * angleForCard)
                : percent * angleForCard,
          ),
        child: CoverPhoto(size: size),
      ),
    );
  }
}

// Widget que gestiona la barra inferior del encabezado sliver personalizado.
class _CustomBottomSliverBar extends StatelessWidget {
  const _CustomBottomSliverBar(
      {super.key,
      required this.size,
      required this.fixrotation,
      required this.percent});
  final Size size;
  final num fixrotation;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: -size.width * fixrotation.clamp(0, 0.35),
        right: 0,
        child: _CustomBottomSliver(
          size: size,
          percent: percent,
        ));
  }
}

// Widget específico para la barra inferior, usando un CustomPaint para dibujar formas personalizadas.
class _CustomBottomSliver extends StatelessWidget {
  const _CustomBottomSliver({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: CutRectangle(),
          ),
          DataCutRectangle(size: size, percent: percent),
        ],
      ),
    );
  }
}
