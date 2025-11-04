import '../models/exam.dart';


final List<Exam> mockExams = [
  Exam(subjectName: 'Мобилни апликации', dateTime: DateTime.now().add(const Duration(days: 2, hours: 3)), rooms: const ['AMF-1', 'Lab-3']),
  Exam(subjectName: 'Алгоритми и структури на податоци', dateTime: DateTime.now().add(const Duration(days: 5, hours: 1)), rooms: const ['A1']),
  Exam(subjectName: 'Бази на податоци', dateTime: DateTime.now().add(const Duration(days: 7, hours: 2)), rooms: const ['B2', 'B3']),
  Exam(subjectName: 'Оперативни системи', dateTime: DateTime.now().subtract(const Duration(days: 1, hours: 4)), rooms: const ['OS-2']),
  Exam(subjectName: 'Мрежни технологии', dateTime: DateTime.now().add(const Duration(days: 1, hours: 6)), rooms: const ['NET-1']),
  Exam(subjectName: 'Вештачка интелигенција', dateTime: DateTime.now().add(const Duration(days: 14)), rooms: const ['AI-1']),
  Exam(subjectName: 'Компјутерска графика', dateTime: DateTime.now().subtract(const Duration(days: 3, hours: 2)), rooms: const ['CG-2']),
  Exam(subjectName: 'Интернет технологии', dateTime: DateTime.now().add(const Duration(days: 9, hours: 5)), rooms: const ['IT-3']),
  Exam(subjectName: 'Калкулус 2', dateTime: DateTime.now().add(const Duration(days: 20, hours: 2)), rooms: const ['M-101']),
  Exam(subjectName: 'Дискретна математика', dateTime: DateTime.now().add(const Duration(days: 11, hours: 4)), rooms: const ['DM-1']),
  Exam(subjectName: 'Програмски јазици', dateTime: DateTime.now().subtract(const Duration(days: 6)), rooms: const ['PL-1']),
];