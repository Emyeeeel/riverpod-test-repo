
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBar extends StatefulWidget {
  const AppBar({super.key});

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoNavigationBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        middle: Icon(Icons.circle),
    );
  }
}