import 'package:flutter/material.dart';
import 'package:fluttersenai/banco/restaurante_dao.dart';
import 'tela_cad_restaurante.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}

Future <void> carregaRestaurante() async{
  final lista = await RestauranteDAO.listarTodos();
  setState((){
    restaurantes = lista;
  });
}

class TelaHomeState extends State<TelaHome>{
List <Restaurante> restaurantes = [];
@override
void initState(){
  super.initState();
  carregaRestaurante();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seja bem vindo Usuário"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: restaurantes.length,
          itemBuilder: (context, index) {
            final r = restaurantes[index];
            return Card(

              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nome ?? 'Sem nome'),
                subtitle: Text('ID: ${r.codigo}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      //lógica para editar Restaurante
                    },
                    icon: Icon(Icons.edit, color: Colors.blue)
                    ),
                    IconButton(onPressed: (){
                      AlertDialog(
                        title: Text("Confirmar ação"),
                        content: Text("Deseja realmente excluir?"),
                        actions: [
                          TextButton(onPressed:(){
                            //lógica pra excluir
                          },
                              child: Text("sim")
                          ),

                          TextButton(onPressed:(){
                            //lógica pra excluir
                          },
                              child: Text("não")
                          ),

                        ],
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.red)
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
      },
        child: Icon(Icons.add),
      ),
    );
  }

}
