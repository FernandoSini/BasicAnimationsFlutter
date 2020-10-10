import 'package:flutter/material.dart';

class AnimacaoBuilder extends StatefulWidget {
  @override
  _AnimacaoBuilderState createState() => _AnimacaoBuilderState();
}

class _AnimacaoBuilderState extends State<AnimacaoBuilder>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    /* definindo que a animação(que vai de 0 até 6 em 2 segundos) tem um controlador */
    /*  */
    /* _animation = Tween<double>(begin: 0, end: 6).animate(_animationController); */
    _animation = Tween<Offset>(
      begin: Offset(0, 0) /* posicao inicial */,
      end: Offset(60, 60) /*  top e left */,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: AnimatedBuilder(
        child: Stack(
          children: [
            Positioned(
              width: 180,
              height: 180,
              left: 0,
              top: 0,
              child: Image.asset('imagens/logo.png'),
            )
          ],
        ),
        animation: _animation,
        builder: (context, widget) {
          /* o animated builder só precisa do context e do builder, não precisa do 3 parametro que é o controlador pq o animation ja faz isso */
          /*  return Transform.rotate(
            angle: _animation.value,
            child: widget,
          ); */
          /* return Transform.scale(
            scale: _animation.value,
            child: widget,
          ); */

          return Transform.translate(
            offset: _animation.value,
            /* o offset define a posição inicial e final do objeto */
            child: widget,
          );
        },
      ),
    );
  }
}
