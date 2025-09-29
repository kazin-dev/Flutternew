import 'package:flutter/material.dart';

class TelaCadRestaurante extends StatelessWidget {
  const TelaCadRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Restaurante"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Informações do Restaurante"),
            const SizedBox(height: 30),

            const Text("Tipo de Comida:"),

            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(
                  value: 'Japonesa',
                  child: Text('Japonesa'),
                ),
                DropdownMenuItem(
                  value: 'Italiana',
                  child: Text('Italiana'),
                ),
                DropdownMenuItem(
                  value: 'Brasileira',
                  child: Text('Brasileira'),
                ),
              ],
              onChanged: (value) {
                // aqui você pode salvar o valor selecionado
                print("Selecionado: $value");
              },
            ),
          ],
        ),
      ),
    );
  }
}
