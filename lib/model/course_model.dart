import 'subject_model.dart';

class Course {
  final String id;
  final String name;
  final List<Subject> subjects; 
  Course({required this.id, required this.name, this.subjects = const []});
}

