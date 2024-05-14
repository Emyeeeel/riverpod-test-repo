import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sign_provider.dart';

// ignore: must_be_immutable
class NamePage extends ConsumerWidget {

  TextEditingController nameTextEditingController = TextEditingController();

  NamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      children: [
        const Text(
          'What\'s your name?', 
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: 50,
          child: CupertinoTextField(
            controller: nameTextEditingController, 
            onChanged: (value){
              ref.read(nameStringValueProvider.notifier).state = value;
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
