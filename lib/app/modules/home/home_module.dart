import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_course/app/shared/repositories/poke_repository.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<PokeReposotory>())),
        Bind((i) => PokeReposotory(i.get<Dio>())),
      ];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', child: (_, args) => HomePage())];
}
