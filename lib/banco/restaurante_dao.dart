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

  static Future<void> excluir(Restaurante r) async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = db.delete('tb_restaurante',
    where: 'cd_restaurante = ?',
    whereArgs: [r.codigo]
    );
  }

  static Future<Restaurante> listar(int? cd) async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_restaurante',
    where: 'cd_restaurante = ?',
    whereArgs: [cd]
    );

    return Restaurante(
      codigo: resultado.first['cd_restaurante'] as int,
      nome: resultado.first['nm_restaurante'] as String,
      latidude: resultado.first['latitude_restaurante'] as String,
      longitude: resultado.first['longitude_restaurante'] as String,
      cutinaria: await TipoDAO.listar(resultado.first['cd_tipo'] as int) as Tipo
    );
  }


}
