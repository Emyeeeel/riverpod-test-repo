import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_repo/screens/main_screens/home_page.dart';

import '../provider/ui_providers.dart';
import '../screens/main_screens/create_page.dart';
import '../screens/main_screens/inbox_page.dart';
import '../screens/main_screens/profile_page.dart';
import '../screens/main_screens/search_page.dart';


class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  static final List<Widget> _widgetOptions = <Widget>[
     const HomePage(),
     SearchPage(),
     const CreatePage(),
     const InboxPage(),
     const ProfilePage()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavigationProvider);
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Color(0xFF797979)),
            activeIcon: Icon(Icons.home_filled, color: Color(0xFF111111)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color(0xFF797979)),
            activeIcon: Icon(Icons.search, color: Color(0xFF111111)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Color(0xFF797979)),
            activeIcon: Icon(Icons.add, color: Color(0xFF111111)),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Color(0xFF797979)),
            activeIcon: Icon(Icons.home_filled, color: Color(0xFF111111)),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Color(0xFF797979)),
            activeIcon: Icon(Icons.home_filled, color: Color(0xFF111111)),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          ref.read(bottomNavigationProvider.notifier).setSelectedIndex(value);
        },
      ),
    );
  }
}
