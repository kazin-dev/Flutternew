import 'package:flutter/material.dart';
import 'package:fluttersenai/telas/tela_login.dart';
import 'estilos/estilos.dart';
import 'usuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tira a faixa de debug
      home: TelaLogin(), // agora inicia na tela de login
    );
  }
}
