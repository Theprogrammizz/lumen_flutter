import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumen_flutter/core/app_theme.dart';
import 'package:lumen_flutter/database/app_db.dart';
import 'package:lumen_flutter/providers/database_provider.dart';
import 'package:lumen_flutter/providers/theme_provider.dart';
import 'package:lumen_flutter/screens/home_screen.dart';
import 'package:lumen_flutter/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();
  final user = await db.getUser();
  final savedTheme = user?.isDarkMode == true ? ThemeMode.dark : ThemeMode.light;
  runApp(ProviderScope(
    overrides: [
      dbProvider.overrideWithValue(db),
      themeModeProvider.overrideWith((ref) => savedTheme),
    ],
    child: MyApp(hasUser: user != null,)));
}

class MyApp extends ConsumerWidget {
  final bool hasUser;
  const MyApp({super.key, required this.hasUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: hasUser ? HomeScreen() : OnboardingScreen(),
    );
  }
}