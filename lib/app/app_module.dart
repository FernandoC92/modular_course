import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_course/app/page/home/home_controller.dart';
import 'package:modular_course/app/page/home/home_page.dart';
import 'package:modular_course/app/page/other/other_page.dart';

import 'app_controller.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController())
      ]; // * array de injeção de depedencies, elas podem ser recuperadas em qualquer lugar do seu app

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        ModularRouter('/other/:text',
            child: (_, args) => OtherPage(
                  text: args.params['text'],
                ))
      ]; // * array de rotas

  @override
  Widget get bootstrap => AppWidget(); // * Widget principal
}
