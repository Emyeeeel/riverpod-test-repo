import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_repo/services/ui_services.dart';

final bottomNavigationProvider = StateNotifierProvider<BottomNavigationService, int>((ref) {
  return BottomNavigationService();
});

