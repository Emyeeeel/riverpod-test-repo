import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textEditingControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

final stringValueProvider = StateProvider<String>((ref) => '');