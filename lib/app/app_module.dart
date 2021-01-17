import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_course/app/modules/home/home_module.dart';
import 'package:modular_course/app/utils/constants.dart';

import 'app_controller.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        // * i.get() já sabe o que espera no params e já pega o dio
        Bind((i) => Dio(BaseOptions(
            baseUrl:
                URL_BASE))), // * Vc poderá chamar o Dio sem precisar instancia-lo
      ]; // * array de injeção de depedencies, elas podem ser recuperadas em qualquer lugar do seu app

  @override
  List<ModularRouter> get routers => [
        // ModularRouter('/other/:text',
        //     child: (_, args) => OtherPage(
        //           text: args.params['text'],
        //         ))
        ModularRouter('/', module: HomeModule()),
      ]; // * array de rotas

  @override
  Widget get bootstrap => AppWidget(); // * Widget principal
}
