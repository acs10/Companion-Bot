import 'package:bottcc/app/modules/home/pages/splah_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'stores/home_store.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/HomePage', child: (_, args) => const HomePage()),
    ChildRoute(Modular.initialRoute, child: (_, args) => const SplahPage()),
  ];
}
