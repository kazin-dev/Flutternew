import 'package:fluttersenai/banco/database_helper.dart';
import 'package:fluttersenai/banco/tipo_dao.dart';
import 'package:fluttersenai/restaurante.dart';
import 'package:fluttersenai/tipo.dart';
import 'database_helper.dart';

class RestauranteDAO{

  static Future<List<Restaurante>> listarTodos() async {
    final db = await DatabaseHelper.getDataBase();
    final resultado  = await db.query('tb_restaurante');

  return resultado.map((mapa){
    return Restaurante(
      codigo: mapa['cd_restaurante'] as int,
      nome: mapa['nm_restaurante'] as String
    );

    }).toList();
  }

  static Future<void> excluir(int codigo) async {
    final db = await DatabaseHelper.getDataBase();
    await db.delete(
      'tb_restaurante',
      where: 'cd_restaurante = ?',
      whereArgs: [codigo],
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
      latitude: resultado.first['latitude_restaurante'] as String,
      longitude: resultado.first['longitude_restaurante'] as String,
      cutinaria: await TipoDAO.listar(resultado.first['cd_tipo'] as int) as Tipo
    );
  }


}
