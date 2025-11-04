import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback? onTap;

  const ExamCard({
    super.key,
    required this.exam,
    this.onTap,
  });

  String _mkDateTime(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    final date = '${two(dt.day)}.${two(dt.month)}.${dt.year}';
    final time = '${two(dt.hour)}:${two(dt.minute)}';
    return '$date • $time';
  }

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast;
    final scheme = Theme.of(context).colorScheme;
    final Color stripeColor =
    isPast ? scheme.errorContainer : scheme.primaryContainer;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Row(
          children: [
            // Left color stripe
            Container(
              width: 8,
              height: 96,
              decoration: BoxDecoration(
                color: stripeColor,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject title
                    Row(
                      children: [
                        Icon(Icons.menu_book_rounded,
                            size: 20, color: scheme.primary),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            exam.subjectName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Exam date/time
                    Row(
                      children: [
                        const Icon(Icons.event, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          _mkDateTime(exam.dateTime),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Rooms info
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.meeting_room_outlined, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            exam.rooms.join(', '),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
