import 'package:bottcc/app/modules/communication/data/http_client.dart';
import 'package:bottcc/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CommunicationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance(HttpClient()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
