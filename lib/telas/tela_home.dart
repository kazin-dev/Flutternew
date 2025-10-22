import 'package:flutter/material.dart';
import 'package:fluttersenai/telas/tela_cad_restaurante.dart';
import 'package:fluttersenai/telas/tela_edit_restaurante.dart';
import 'package:fluttersenai/restaurante.dart';
import 'package:fluttersenai/banco/restaurante_dao.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}

class TelaHomeState extends State<TelaHome> {
  List<Restaurante> restaurantes = [];

  @override
  void initState() {
    super.initState();
    carregarRestaurantes();
  }

  Future<void> carregarRestaurantes() async {
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
      restaurantes = lista;
    });
  }

  void excluirRestaurante(int id) async {
    await RestauranteDAO.excluir(id);
    carregarRestaurantes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Restaurantes"),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaCadRestaurante()),
              );
              carregarRestaurantes();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: restaurantes.length,
          itemBuilder: (context, index) {
            final restaurante = restaurantes[index];
            return Card(
              child: ListTile(
                title: Text(restaurante.nome ?? ''),
                subtitle: Text('ID: ${restaurante.codigo ?? ''}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaEditarRestaurante(
                              restaurante: {
                                'nome': restaurante.nome,
                                'tipo': restaurante.cutinaria?.descricao ?? '',
                                'latitude': restaurante.latitude,
                                'longitude': restaurante.longitude,
                              },
                            ),
                          ),
                        );

                        carregarRestaurantes();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Confirmação'),
                            content: const Text('Deseja excluir este restaurante?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  excluirRestaurante(restaurante.codigo!);
                                  Navigator.pop(context);
                                },
                                child: const Text('Excluir'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaCadRestaurante()),
          );
          carregarRestaurantes();
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
        ],
      ),
    );
  }
}
