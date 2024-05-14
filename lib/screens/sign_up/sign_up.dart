import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../landing.dart';
import 'bday.dart';
import 'email.dart';
import 'name.dart';
import 'pass.dart';
import '../../provider/ui_providers.dart';
import '../../provider/sign_provider.dart';

class SignUpNavigation extends ConsumerWidget {
  SignUpNavigation({Key? key}) : super(key: key);

  static final List<Widget> _widgetOptions = <Widget>[
    EmailPage(),
    PasswordPage(),
    NamePage(),
    BirthdayPage()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavigationProvider);
    final stringValue = ref.watch(stringProviders[selectedIndex]);
    final isDateCurrent = ref.watch(isDateTimeProvider(selectedIndex));
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 25,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    final prevIndex = selectedIndex - 1;
                    if (prevIndex < 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LandingPage()));
                    }
                    else{
                      ref.read(bottomNavigationProvider.notifier).setSelectedIndex(prevIndex);
                    }
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const Spacer(),
                Row(
                  children: List.generate(
                    7,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        ((index < selectedIndex) || (index == selectedIndex)) ? Icons.circle : Icons.circle_outlined,
                        size: 10,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          _widgetOptions.elementAt(selectedIndex),
          const Spacer(),
          MaterialButton( 
            onPressed: (((selectedIndex != 3) && stringValue.isEmpty) || ((selectedIndex == 3) && isDateCurrent)) ? null :() {
              final nextIndex = selectedIndex + 1;
              ref.read(bottomNavigationProvider.notifier).setSelectedIndex(nextIndex);
            },
            color: (((selectedIndex != 3) && stringValue.isEmpty) || ((selectedIndex == 3) && isDateCurrent)) ? null : Colors.red,
            disabledColor: const Color(0xFFE0E0E0),
            minWidth: MediaQuery.of(context).size.width - 40,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                color: (((selectedIndex != 3) && stringValue.isEmpty) || ((selectedIndex == 3) && isDateCurrent)) ? Colors.black : Colors.white, fontSize: 18), 
            ),
          ),
          const SizedBox(height: 25,),
        ],
      ),
    );
  }
}
