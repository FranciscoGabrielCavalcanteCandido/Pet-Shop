import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:pet_shop/banco/sqlite/conexao.dart';
import 'package:pet_shop/banco/sqlite/donoDAO.dart';
import 'package:pet_shop/domain/dono.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late Database db;
  late Dono dono;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String path = join(await getDatabasesPath(), 'banco.db');
    db = await Conexao.getConexao();
    dono = Dono(
        nome: 'Francisco',
        telefone: 5566334488,
        cpf: '556699887711',
        cidade: 'Amaporã',
        bairro: 'centro');
  });

  tearDownAll(() {
    db.close();
  });

  group("Testando DonoDAO", () {
    test("Testando metodo salvar DonoDAO", () async {
      var salvando = await DonoDAO().salvar(dono);
      expect(salvando, true);
    });

    test("Testando metodo excluir DonoDAO", () async {
      await DonoDAO().salvar(dono);
      var excluirDono = await DonoDAO().excluir(2);
      expect(excluirDono, true);
    });

    test("Testando metodo consultar DonoDAO", () async {
      await DonoDAO().salvar(dono);
      var consultarDono = await DonoDAO().consultar(4);
      expect(consultarDono, isInstanceOf<Dono>());
    });
  });
}
