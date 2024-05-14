import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_repo/test.dart';
import 'package:test_repo/widgets/bottom_nav.dart';

import 'pass.dart';
import 'sign.dart';
import 'widgets/nav_bar.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpNavigation()
    );
  }
}


