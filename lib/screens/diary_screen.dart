import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumen_flutter/providers/database_provider.dart';
import 'package:lumen_flutter/utils/diary_card.dart';

class DiaryScreen extends ConsumerWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final diaryAsync = ref.watch(diaryProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userAsync.when(
              data: (user) => Text(
                "Hello, ${user?.name ?? 'there'}!",
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              loading: () => const Text("Hello!"),
              error: (e, _) => const Text("Hello!"),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: diaryAsync.when(
                data: (entries) => entries.isEmpty
                    ? const Center(child: Text("No entries yet. Start writing!"))
                    : ListView.builder(
                        itemCount: entries.length,
                        itemBuilder: (context, index) {
                          final entry = entries[index];
                          return DiaryCard(
                            title: entry.title,
                            body: entry.body,
                            formattedDate: _formatDate(entry.createdAt),
                            formattedTime: _formatTime(entry.createdAt),
                          );
                        },
                      ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => const Center(child: Text("Something went wrong")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final m = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $period';
  }
}