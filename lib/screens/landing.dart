import 'package:flutter/material.dart';
import 'package:test_repo/screens/log_in.dart';

import 'sign_up/sign_up.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Landing Page'),
            MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpNavigation()));
              },
              minWidth: MediaQuery.of(context).size.width - 40,
              height: 50,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text('Sign up'),
            ),
            SizedBox(height: 50,),
            MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage()));
              },
              minWidth: MediaQuery.of(context).size.width - 40,
              height: 50,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text('Log in'),
            )
          ],
        ),
      ),
    );
  }
}