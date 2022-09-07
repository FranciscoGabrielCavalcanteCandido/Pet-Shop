import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/banco/sqlite/animalDAO.dart';
import 'package:pet_shop/domain/animal.dart';

class AnimalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Animal'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, './animalCadastro').then((value){
                  setState((){});
                });
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: FutureBuilder(
            future: AnimalDAO().listar(),
            builder: (context, AsyncSnapshot<List<Animal>> dadosRetornados) {
              if (!dadosRetornados.hasData) {
                return const CircularProgressIndicator();
              }
              var listAnimal = dadosRetornados.data!;

              return ListView.builder(
                  itemCount: listAnimal.length,
                  itemBuilder: (context, index) {
                    var animal = listAnimal[index];

                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.pinkAccent,
                          child: Text(listAnimal[index]
                              .toString()
                              .substring(0, 1)
                              .toUpperCase()),
                        ),
                        title: Text(animal.nome),
                        subtitle: Text(animal.raca),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    );
                  });
            }));
  }
}


