import 'package:flutter/material.dart';

class TelaCadRestaurante extends StatelessWidget {
  const TelaCadRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Restaurante")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Informações do Restaurante:"),
            const SizedBox(height: 40),
            const Text("Tipo de comida: "),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: "Japonesa", child: Text("Japonesa")),
                DropdownMenuItem(value: "Italiana", child: Text("Italiana")),
                DropdownMenuItem(value: "Brasileira", child: Text("Brasileira")),
              ],
              onChanged: (value) {},
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
              validator: (String? value) {},
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Latitude'),
              validator: (String? value) {},
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Longitude'),
              validator: (String? value) {},
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.save),
                  SizedBox(width: 8),
                  Text("Cadastrar"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
