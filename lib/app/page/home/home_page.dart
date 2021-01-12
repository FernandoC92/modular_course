import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_course/app/page/home/home_controller.dart';

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
      body: Center(
        child: TextField(
          onChanged: (value) {
            homeController.text = value;
          },
          decoration: InputDecoration(labelText: 'Um Texto qualquer'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.pushNamed(context, '/other/${homeController.text}');
          Modular.to.pushNamed(
              '/other/${homeController.text}'); // * pode se chamado em qualquer lugar
        },
      ),
    );
  }
}
