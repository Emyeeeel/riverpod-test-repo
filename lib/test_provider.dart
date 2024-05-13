import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'test_model.dart';

final unsplashPhotosProvider = FutureProvider<List<UnsplashPhoto>>((ref) async {
  final response = await http.get(Uri.parse('https://api.unsplash.com/photos/random?count=10&query=wallpaper&orientation=portrait&client_id=N__PKKjjE_rGt2fsn4xs_HXE0ajm7pLn5MJxUDMIHCk'));
  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => UnsplashPhoto.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load photos');
  }
});
