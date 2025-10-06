import 'package:flutter/material.dart';
import 'package:fluttersenai/telas/tela_login.dart';
import 'estilos/estilos.dart';
import 'usuario.dart';
import 'telas/tela_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tira a faixa de debug
      home: TelaHome(), // agora inicia na tela de login
    );
  }
}
