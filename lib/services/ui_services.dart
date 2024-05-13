// navigation_notifier.dart
import 'package:riverpod/riverpod.dart';

class BottomNavigationService extends StateNotifier<int> {
  BottomNavigationService() : super(0);

  void setSelectedIndex(int index) {
    state = index;
  }
}

