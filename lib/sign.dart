import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/ui_providers.dart';
// ignore: must_be_immutable
class NavigatorWidget extends ConsumerWidget {
  NavigatorWidget({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavigationProvider);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new_rounded),
                const Spacer(),
                Row(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        index == selectedIndex ? Icons.circle : Icons.circle_outlined,
                        size: 10,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Text(
            'What\'s your email?', 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            child: CupertinoTextField(
                controller: _emailController,
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                placeholder: 'Enter your email',
                placeholderStyle: const TextStyle(color: Color(0xFF8E8E8E)),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: CupertinoColors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
            ),
          ),
          const Spacer(),
          MaterialButton( 
            onPressed: null,
            // (){
            //   final nextIndex = selectedIndex + 1;
            //   ref.read(bottomNavigationProvider.notifier).setSelectedIndex(nextIndex);
            // }, 
            disabledColor: const Color(0xFFE0E0E0),
            minWidth: MediaQuery.of(context).size.width - 40,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
