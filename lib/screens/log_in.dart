import 'package:flutter/material.dart';

import 'sign_up/sign_up.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Log in Page'),
          ],
        ),
      ),
    );
  }
}