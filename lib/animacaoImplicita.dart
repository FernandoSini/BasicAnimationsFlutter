import 'package:flutter/material.dart';

class AnimacaoImplicita extends StatefulWidget {
  @override
  _AnimacaoImplicitaState createState() => _AnimacaoImplicitaState();
}

class _AnimacaoImplicitaState extends State<AnimacaoImplicita> {
  /* apartir desse status serão feitos as animações */
  bool _status = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          /* agora da pra fazer animações implicitas, é um container que faz animações, usa interpolação(intervalo entre o tamanho inicial e final) */
          padding: EdgeInsets.all(20),
          width: _status ? 200 : 300,
          height: _status ? 200 : 300,
          color: _status ? Colors.blue : Colors.purpleAccent,
          child: Image.asset('imagens/logo.png'),
          duration: Duration(seconds: 3),
          curve: Curves
              .elasticInOut, //definindo as maneiras como vai ser animado o container
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              _status = !_status;
            });
          },
          child: Text("Alterar"),
        ),
      ],
    );
  }
}
