import '../models/question.dart';

List<Question> questions = [
  Question(
    questionText: 'Apa kepanjangan dari SIM?',
    options: ['Sistem Informasi Manajemen', 'Sistem Informasi Medis', 'Sistem Integrasi Mahasiswa'],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: 'Bahasa pemrograman utama Flutter adalah?',
    options: ['Java', 'Dart', 'Kotlin', 'Python'],
    correctAnswerIndex: 1,
  ),
  Question(
    questionText: 'Manakah yang merupakan framework UI?',
    options: ['Laravel', 'Flutter', 'Node.js', 'Express'],
    correctAnswerIndex: 1,
  ),
  // Tambahkan minimal 7 soal lainnya
];
