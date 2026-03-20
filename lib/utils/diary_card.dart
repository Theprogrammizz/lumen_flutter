import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  final String title;
  final String body;
  final String formattedDate;
  final String formattedTime;
  const DiaryCard({super.key, required this.title, required this.body, required this.formattedDate, required this.formattedTime});

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.circular(20),
  ),
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // top content area (where dog image is)
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),

      const SizedBox(height: 12),

      // bottom meta row
      Row(
        children: [
          _metaItem(context, 'Date', formattedDate.toString()),
          const SizedBox(width: 24),
          _metaItem(context, 'Time', formattedTime.toString()),
        ],
      ),
    ],
  ),
);
  }
}

Widget _metaItem(BuildContext context, String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.labelSmall),
      Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      )),
    ],
  );
}