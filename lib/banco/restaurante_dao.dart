import 'package:fluttersenai/banco/ database_helper.dart';
import 'package:fluttersenai/restaurante.dart';
import ' database_helper.dart';

class RestauranteDAO{
  static Future<List<Restaurante>> listarTodos() async {
    final db = await DatabaseHelper.getDataBase();
    final resultado  = await db.query('tb_retaurante');

  return resultado.map((mapa){
    return Restaurante(
      codigo: mapa['cd_restaurante'] as int,
      nome: mapa['nm_restaurante'] as String
    );

    }).toList();
  }
}
