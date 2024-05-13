
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpAppBar extends ConsumerWidget {
  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        title: Row(
          children: List.generate(6, (index) => Icon(Icons.circle)),
      ),
    );
  }
}