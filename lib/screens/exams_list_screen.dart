import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';


class ExamsListScreen extends StatelessWidget {
  final List<Exam> exams;
  const ExamsListScreen({super.key, required this.exams});


  @override
  Widget build(BuildContext context) {
// Sort chronologically by date
    final sorted = [...exams]..sort((a, b) => a.dateTime.compareTo(b.dateTime));


    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 211517'),
      ),
      body: ListView.builder(
        itemCount: sorted.length,
        itemBuilder: (context, index) {
          final exam = sorted[index];
          return ExamCard(
            exam: exam,
            onTap: () => Navigator.pushNamed(
              context,
              ExamDetailScreen.routeName,
              arguments: exam,
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge(
                label: Text(sorted.length.toString()),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
                  child: Text('Вкупно испити', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}