import 'dart:async';
import 'package:bottcc/app/modules/home/styles/Mystyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../stores/home_store.dart';

class SplahPage extends StatefulWidget {
  final String title;
  const SplahPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _SplahPageState createState() => _SplahPageState();
}

class _SplahPageState extends State<SplahPage> {
  final HomeStore homeStore = Modular.get();
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Modular.to.pushNamed('/HomePage');
    });
    return Scaffold(
      body: Container(
        decoration: MyStyles().backgroundColor(),
        child: Padding(
          padding: const EdgeInsets.only(top: 230.0, left: 35.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                "lib/app/modules/home/assets/homePage/logo.png",
                width: 258,
                height: 258,
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 8, right: 20),
                  child: Text('BOT-FRIEND',
                      style: TextStyle(fontSize: 34, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
