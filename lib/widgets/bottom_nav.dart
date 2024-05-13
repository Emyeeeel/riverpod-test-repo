
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_repo/provider/ui_providers.dart';
import 'package:test_repo/services/ui_services.dart';
import 'package:test_repo/screens/navigation/create_page.dart';
import 'package:test_repo/screens/navigation/home_page.dart';
import 'package:test_repo/screens/navigation/inbox_page.dart';
import 'package:test_repo/screens/navigation/profile_page.dart';
import 'package:test_repo/screens/navigation/search_page.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavigationProvider);
    return Scaffold(
      body: [
        const HomePage(),
        const SearchPage(),
        const CreatePage(),
        const InboxPage(),
        const ProfilePage()
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined), 
            label: 'Home'),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined), 
            label: 'Search'),
          NavigationDestination(
            selectedIcon: Icon(Icons.create),
            icon: Icon(Icons.create_outlined), 
            label: 'Create'),
          NavigationDestination(
            selectedIcon: Icon(Icons.inbox),
            icon: Icon(Icons.inbox_outlined), 
            label: 'Inbox'),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline), 
            label: 'Profile')
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          ref.read(bottomNavigationProvider.notifier).setSelectedIndex(value);
        },
      ),
    );
  }
}