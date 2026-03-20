import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumen_flutter/providers/database_provider.dart';
import 'package:lumen_flutter/providers/theme_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final themeMode = ref.watch(themeModeProvider);
    final theme = Theme.of(context);
    final isDark = themeMode == ThemeMode.dark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 24),

            // avatar + name
            userAsync.when(
              data: (user) => Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      user?.name.substring(0, 1).toUpperCase() ?? '?',
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.name ?? 'Unknown',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Diary Author',
                        style: theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => const Text('Error loading user'),
            ),

            const SizedBox(height: 32),

            // settings section
            Text(
              'Settings',
              style: theme.textTheme.labelSmall?.copyWith(
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 12),

            // theme toggle
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(
                  isDark ? Icons.dark_mode : Icons.light_mode,
                  color: theme.colorScheme.primary,
                ),
                title: const Text('Theme'),
                subtitle: Text(isDark ? 'Dark' : 'Light'),
                trailing: Switch(
                  value: isDark,
                  activeThumbColor: theme.colorScheme.primary,
                  onChanged: (val) async {
                    ref.read(themeModeProvider.notifier).state =
                        val ? ThemeMode.dark : ThemeMode.light;
                    await ref.read(dbProvider).toggleTheme(val);
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            // change name
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.edit_outlined,
                  color: theme.colorScheme.primary,
                ),
                title: const Text('Change Name'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showChangeNameDialog(context, ref),
              ),
            ),

            const SizedBox(height: 32),

            // about section
            Text(
              'About',
              style: theme.textTheme.labelSmall?.copyWith(
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.primary,
                ),
                title: const Text('Lumen'),
                subtitle: const Text('v1.0.0 — Your personal diary'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChangeNameDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Change Name'),
        content: TextField(
          controller: controller,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(hintText: 'Enter new name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final name = controller.text.trim();
              if (name.isEmpty) return;
              await ref.read(dbProvider).updateName(name);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}