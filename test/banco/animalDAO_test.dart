import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:pet_shop/banco/sqlite/animalDAO.dart';
import 'package:pet_shop/banco/sqlite/conexao.dart';
import 'package:pet_shop/domain/animal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late Database db;
  late Animal animal;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String path = join(await getDatabasesPath(), 'banco.db');
    db = await Conexao.getConexao();
    animal = Animal(nome: 'Cachorro', raca: 'Pitbull');
  });

  tearDownAll(() {
    db.close();
  });

  group("Testando AnimalDAO", () {
    test("Testando metodo salvar AnimalDAO", () async {
      var salvandoAnimal = await AnimalDAO().salvar(animal);
      expect(salvandoAnimal, true);
    });

    test("Testando metodo excluir AnimalDAO", () async {
      await AnimalDAO().salvar(animal);
      var excluirAnimal = await AnimalDAO().excluir(2);
      expect(excluirAnimal, true);
    });

    test("Testando metodo consultar AnimalDAO", () async {
      await AnimalDAO().salvar(animal);
      var consultarAnimal = await AnimalDAO().consultar(3);
      expect(consultarAnimal, isInstanceOf<Animal>());
    });
  });
}
