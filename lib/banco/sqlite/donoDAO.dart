import 'package:pet_shop/banco/sqlite/conexao.dart';
import 'package:pet_shop/domain/dono.dart';
import 'package:sqflite/sqflite.dart';

class DonoDAO {
  late Database _db;
  late String _sql;

  Future<bool> salvar(Dono dono) async {
    _db = await Conexao.getConexao();
    _sql = 'INSERT INTO dono (nome, telefone, cpf, cidade, bairro) VALUES (?,?,?,?,?)';
    int linhasAfetadas = await _db.rawInsert(_sql, [dono.nome, dono.telefone, dono.cpf, dono.cidade, dono.bairro]);
    return linhasAfetadas > 0;
  }
}
