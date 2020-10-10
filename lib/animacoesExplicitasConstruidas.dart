import 'package:flutter/material.dart';

class AnimacoesExplicitasConstruidas extends StatefulWidget {
  @override
  _AnimacoesExplicitasConstruidasState createState() =>
      _AnimacoesExplicitasConstruidasState();
}

class _AnimacoesExplicitasConstruidasState
    extends State<AnimacoesExplicitasConstruidas>
    with SingleTickerProviderStateMixin {
/* esse mixin vai informar pro animation controller toda vez que a tela for renderizada */
  AnimationController _animationController;
  AnimationStatus _animationStatus;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      /* definindo quanto tempo vai ser a duração */
      duration: Duration(seconds: 5),
      vsync: this,
    )
      ..repeat()
      ..addStatusListener((status) {
        _animationStatus = status;
      }); /* add status vai permitir monitorar qual é o status da animação */
    /* ..repeat(); /* repetindo de forma indefinida */ */
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: 300,
            height: 400,
            child: RotationTransition(
              /*  no turns vamos controlar a animação com um controller*/
              turns: _animationController,
              child: Image.asset("imagens/logo.png"),
              alignment: Alignment.center,
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (_animationStatus == AnimationStatus.dismissed) {
                //_animationController.forward();
                _animationController.repeat();
              } else {
                _animationController.reverse();
              }
              /*  if (_animationController.isAnimating) {
                _animationController.stop();
              } else {
                _animationController.repeat();
              } */
            },
            child: Text("Pressed"),
          ),
        ],
      ),
    );
  }
}
