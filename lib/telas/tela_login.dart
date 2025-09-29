import 'package:flutter/material.dart';
import 'package:fluttersenai/banco/usuario_dao.dart';
import 'package:fluttersenai/telas/tela_home.dart';
import 'package:fluttersenai/usuario.dart';

class TelaLogin extends StatelessWidget {
  TelaLogin({super.key});

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela de Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Usuário'),
              controller: usuarioController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              controller: senhaController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final sucesso = await UsuarioDAO.autenticar(
                  usuarioController.text,
                  senhaController.text,
                );

                if (sucesso) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaHome(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login inválido!'),
                    ),
                  );
                }
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
