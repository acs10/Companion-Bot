import 'package:flutter/material.dart';

class MyStyles {
  BoxDecoration backgroundColor() {
    return const BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff04F0FF),
        Color(0xff00D4FF),
        Color(0xffC625FF),
      ],
    ));
  }
}
