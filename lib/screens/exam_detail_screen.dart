import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  static const routeName = '/exam';

  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  /// Formats a DateTime like "dd.MM.yyyy • HH:mm"
  String _mkDateTime(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    final date = '${two(dt.day)}.${two(dt.month)}.${dt.year}';
    final time = '${two(dt.hour)}:${two(dt.minute)}';
    return '$date • $time';
  }

  /// Returns "X дена, Y часа" and a flag if it's in the past.
  (String text, bool isPast) _remainingText() {
    final diff = exam.dateTime.difference(DateTime.now());
    final isPast = diff.isNegative;

    final abs = diff.abs();
    final days = abs.inDays;
    final hours = abs.inHours - days * 24;

    final base = '$days дена, $hours часа';
    final text = isPast ? 'Испитот помина пред $base' : 'Преостанува: $base';
    return (text, isPast);
  }

  @override
  Widget build(BuildContext context) {
    final (remainText, isPast) = _remainingText();
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Детали за испит')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject
            Row(
              children: [
                Icon(Icons.menu_book_rounded, color: scheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    exam.subjectName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Date & time
            Row(
              children: [
                const Icon(Icons.event),
                const SizedBox(width: 8),
                Text(
                  _mkDateTime(exam.dateTime),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Rooms
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.meeting_room_outlined),
                const SizedBox(width: 8),
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: exam.rooms.map((r) => Chip(label: Text(r))).toList(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Remaining time / Passed info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: isPast ? scheme.errorContainer : scheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer_outlined),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      remainText,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
