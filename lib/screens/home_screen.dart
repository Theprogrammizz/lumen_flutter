import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lumen_flutter/providers/nav_provider.dart';
import 'package:lumen_flutter/screens/add_diary_screen.dart';
import 'package:lumen_flutter/screens/diary_screen.dart';
import 'package:lumen_flutter/screens/profile_screen.dart';

class HomeScreen extends ConsumerWidget {
 const HomeScreen({super.key});

  final pages = const [
    DiaryScreen(),
    AddDiaryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navProvider);
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: GNav(
          selectedIndex: currentIndex,
          onTabChange: (index) {
            ref.read(navProvider.notifier).updateIndex(index);
          },
          rippleColor: Colors.grey.withValues(alpha: 0.1),
          hoverColor: Colors.grey.withValues(alpha: 0.1),
          gap: 8,
          activeColor: Colors.white,
          color: Colors.grey,
          iconSize: 22,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 300),
          tabBackgroundColor: themeColor.primary, // your sage green
          tabs: const [
            GButton(icon: Icons.book_outlined, text: 'Diary'),
            GButton(icon: Icons.add, text: 'New'),
            GButton(icon: Icons.person_outline, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
