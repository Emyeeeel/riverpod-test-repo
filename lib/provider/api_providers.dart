import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/api_services.dart';

final unsplashPhotosProvider = FutureProvider<List<dynamic>>((ref) async {
  final service = ApiService();
  return service.fetchPhotos();
});

final searchPhotoProvider = FutureProvider.family<List<dynamic>, String>((ref, query) async {
  final service = ApiService();
  return service.searchPhoto(query);
});

final randomPhotoProvider = FutureProvider<List<dynamic>>((ref) async {
  final service = ApiService();
  return service.getRandomPhotos();
});
