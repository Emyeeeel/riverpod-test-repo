import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/sign_provider.dart';

// ignore: must_be_immutable
class PasswordPage extends ConsumerWidget {

  TextEditingController passTextEditingController = TextEditingController();

  PasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      children: [
        const Text(
          'Create a password', 
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: 50,
          child: CupertinoTextField(
            obscureText: true,
              controller: passTextEditingController, 
              onChanged: (value){
                ref.read(passStringValueProvider.notifier).state = value;
              },
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              placeholder: 'Enter your password',
              placeholderStyle: const TextStyle(color: Color(0xFF8E8E8E)),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: CupertinoColors.black),
                borderRadius: BorderRadius.circular(16),
              ),
          ),
        ),
      ],
    );
  }
}
