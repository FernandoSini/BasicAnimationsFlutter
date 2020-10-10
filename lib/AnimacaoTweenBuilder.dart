import 'package:flutter/material.dart';

/* tween builder e uma forma de fazer animações implicitas sem usar um widget especifico para animação*/
class AnimacaoTweenBuilder extends StatefulWidget {
  @override
  _AnimacaoTweenBuilderState createState() => _AnimacaoTweenBuilderState();
}

class _AnimacaoTweenBuilderState extends State<AnimacaoTweenBuilder> {
  static final colorTween = ColorTween(begin: Colors.white, end: Colors.orange);
  @override
  Widget build(BuildContext context) {
    return Center(
      /* animação de rotação/rotation animation */
      /*  child: TweenAnimationBuilder(
        /* o tween define o tipo de interpolação/mudança que você irá fazer, voce define o inicio e o fim */
        tween: Tween<double>(begin: 0, end: 6.28),
        builder: (BuildContext context, double angulo, Widget widget) {
          /* aqui será executado entre 0 e 6.28 */
          return Transform.rotate(
            angle: angulo,
            /* estará entre 0 e 6.28 */
            child: Image.asset('imagens/logo.png'),
          );
        },
        duration: Duration(seconds: 2),
      ), */

/* animação de aumento de largura */
      /*  child: TweenAnimationBuilder(
        /* o tween define o tipo de interpolação/mudança que você irá fazer, voce define o inicio e o fim */
        tween: Tween<double>(begin: 50, end: 180),
        builder: (BuildContext context, double largura, Widget widget) {
          /* aqui será executado entre 0 e 6.28 */
          return Container(
            color: Colors.green,
            /* estará entre 0 e 6.28 */
            width: largura,
            height: 60,
          );
        },
        duration: Duration(seconds: 2),
      ), */

      child: TweenAnimationBuilder(
        /* o tween define o tipo de interpolação/mudança que você irá fazer, voce define o inicio e o fim */
        tween: colorTween,
        child: Image.asset('imagens/estrelas.jpg'),
        builder: (BuildContext context, Color color, Widget widget) {
          /* aqui será executado entre 0 e 6.28 */
          return ColorFiltered(
            colorFilter: ColorFilter.mode(color, BlendMode.overlay),
            child: widget,
          );
        },
        duration: Duration(seconds: 2),
      ),
    );
  }
}
