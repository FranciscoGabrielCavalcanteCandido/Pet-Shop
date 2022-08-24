import 'package:pet_shop/banco/sqlite/conexao.dart';
import 'package:pet_shop/domain/animal.dart';
import 'package:pet_shop/domain/dono.dart';
import 'package:sqflite/sqflite.dart';

class AnimalDAO {
  late Database _db;
  late String _sql;

  Future<bool> salvar(Animal animal) async {
    _db = await Conexao.getConexao();
    _sql = 'INSERT INTO animal (nome, raca) VALUES (?,?)';
    int linhasAfetadas = await _db.rawInsert(_sql, [animal.nome, animal.raca]);
    return linhasAfetadas > 0;
  }


  
}
