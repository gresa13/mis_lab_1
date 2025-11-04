import 'package:flutter/material.dart';
import 'models/exam.dart';
import 'screens/exams_list_screen.dart';
import 'screens/exam_detail_screen.dart';
import 'data/mock_exams.dart';


void main() {
  runApp(const ExamApp());
}


class ExamApp extends StatelessWidget {
  const ExamApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Распоред за испити - 211517',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F51B5)),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      routes: {
        '/': (context) => ExamsListScreen(exams: mockExams),
        ExamDetailScreen.routeName: (context) {
          final exam = ModalRoute.of(context)!.settings.arguments as Exam;
          return ExamDetailScreen(exam: exam);
        },
      },
    );
  }
}