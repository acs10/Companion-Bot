import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final HomeStore homeStore = Modular.get();

  late TabController _tabController;

  final _kTabPages = <Widget>[
    Padding(
      padding: const EdgeInsets.only(top: 250.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            "lib/app/modules/home/assets/homePage/speak.png",
            width: 200,
            height: 200,
          ),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Toque para falar',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
          ),
        ],
      ),
    ),
    const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.home), text: 'Inicial'),
    Tab(icon: Icon(Icons.note), text: 'Lembretes'),
    Tab(icon: Icon(Icons.view_agenda), text: 'Agenda'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: Material(
        color: Color(0xff00D4FF),
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
