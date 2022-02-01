import 'dart:async';
import 'Student.dart';
import 'package:flutter/material.dart';

class StudentBloc {
  final List<Student> _studentList = [Student(1, 'Fadi', 85),
    Student(2, 'Ahmad', 77.5),
    Student(3, 'Ammar', 89.5),
    Student(4, 'Khaled', 90),

  ];

  final _studentListStreamController = StreamController<List<Student>>();
  final _studentScoreIncrementStreamController = StreamController<Student>();
  final _studentScoreDecrementStreamController = StreamController<Student>();

  Stream<List<Student>> get studentListStreamController =>
      _studentListStreamController.stream;
  StreamSink<List<Student>> get studentListSink =>
      _studentListStreamController.sink;

  StreamSink<Student> get studenScoreIncrement =>
      _studentScoreIncrementStreamController.sink;

  StreamSink<Student> get studemScoreDecrement =>
      _studentScoreDecrementStreamController.sink;

  StudentBloc() {
    _studentListStreamController.add(_studentList);
    _studentScoreIncrementStreamController.stream.listen(_incrementScore);
    _studentScoreDecrementStreamController.stream.listen(_decrementScore);
  }

  _incrementScore(Student student) {
    double score = student.score;
    double incrementValue = 0.5;
    if (student.score < 100) {
      _studentList[student.id - 1].score + incrementValue;
    }
    studentListSink.add(_studentList);
  }

  _decrementScore(Student student) {
    double score = student.score;
    double incrementValue = 0.5;
    if (student.score > 0) {
      _studentList[student.id - 1].score - incrementValue;
    }
    studentListSink.add(_studentList);
  }

  void dispose() {
    _studentListStreamController.close();
    _studentScoreIncrementStreamController.close();
    _studentScoreDecrementStreamController.close();
  }
}
