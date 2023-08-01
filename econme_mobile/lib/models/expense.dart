import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { work, food, education, personal, medical, transport, entertainment }
enum Type { credit, debit }

class Expense{
  Expense({ required this.type, required this.category, required this.title, required this.amount, required this.date }) : id = uuid.v4();

  final String title;
  final Category category;
  final double amount;
  final Type type;
  final String id;
  final DateTime date;
}