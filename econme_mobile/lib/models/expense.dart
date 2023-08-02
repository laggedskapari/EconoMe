import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { work, food, education, personal, medical, transport, entertainment}
enum AmountType { credit, debit }

final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.work: Icons.work,
  Category.food: Icons.fastfood_rounded,
  Category.education: Icons.book_rounded,
  Category.personal: Icons.person,
  Category.medical: Icons.medication,
  Category.transport: Icons.emoji_transportation_rounded,
  Category.entertainment: Icons.local_movies_rounded
};

const amountType = {
  AmountType.credit: '+',
  AmountType.debit: '-'
};

class Expense{
  Expense({ required this.type, required this.category, required this.title, required this.amount, required this.date }) : id = uuid.v4();

  final String title;
  final Category category;
  final double amount;
  final AmountType type;
  final String id;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}