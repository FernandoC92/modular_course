import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_course/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<
      HomeController>(); // * tem que estar na lista de bind, vc tbm pode instaciar dentro do OtherPage (injeção de dependencia, pois o HomeController esta disponivel no AppModule)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage -> /'),
      ),
      body: Observer(builder: (_) {
        if (homeController.pokemons.error != null) {
          return Center(
            child: RaisedButton(
              child: Text('press again'),
              onPressed: () {
                homeController.fetchPokemons();
              },
            ),
          );
        }
        if (homeController.pokemons.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var list = homeController.pokemons.value;

        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(list[index].name),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.pushNamed(context, '/other/${homeController.text}');
          Modular.to.pushNamed(
              '/other/$homeController'); // * pode se chamado em qualquer lugar
        },
      ),
    );
  }
}
