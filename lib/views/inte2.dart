import 'dart:math';

import 'package:flutter/material.dart';

class ExpensePlannerDashboard extends StatefulWidget {
  @override
  _ExpensePlannerDashboardState createState() => _ExpensePlannerDashboardState();
}

class _ExpensePlannerDashboardState extends State<ExpensePlannerDashboard> {
  List<ExpenseCategory> expenseCategories = [
    ExpenseCategory(name: 'Loyer', amount: 1000.0),
    ExpenseCategory(name: 'Courses', amount: 500.0),
    ExpenseCategory(name: 'Transport', amount: 200.0),
    ExpenseCategory(name: 'Loisirs', amount: 300.0),
    ExpenseCategory(name: 'Autres', amount: 150.0),
  ];

  @override
  Widget build(BuildContext context) {
    double totalExpenses = expenseCategories.fold(0.0, (sum, category) => sum + category.amount);

    return Scaffold(
      appBar: AppBar(
        title: Text('Planification des Dépenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre et période
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Voici vos dépenses de mai 2024',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),

            // Graphique circulaire
            Expanded(
              child: CustomPaint(
                painter: PieChartPainter(expenseCategories, totalExpenses),
                child: Center(
                  child: Text(
                    '\$${totalExpenses.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            // Liste des catégories de dépenses
            Expanded(
              child: ListView.builder(
                itemCount: expenseCategories.length,
                itemBuilder: (context, index) {
                  final category = expenseCategories[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getColorForCategory(category.name),
                      child: Text(
                        category.name[0].toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(category.name),
                    trailing: Text(
                      '\$${category.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getColorForCategory(category.name),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForCategory(String categoryName) {
    switch (categoryName) {
      case 'Loyer':
        return Colors.blue;
      case 'Courses':
        return Colors.green;
      case 'Transport':
        return Colors.orange;
      case 'Loisirs':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

class ExpenseCategory {
  final String name;
  final double amount;

  ExpenseCategory({required this.name, required this.amount});
}

class PieChartPainter extends CustomPainter {
  final List<ExpenseCategory> expenseCategories;
  final double totalExpenses;

  PieChartPainter(this.expenseCategories, this.totalExpenses);

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = 0.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 4;

    for (final category in expenseCategories) {
      final sweepAngle = 2 * pi * (category.amount / totalExpenses);
      final paint = Paint()
        ..color = _getColorForCategory(category.name)
        ..style = PaintingStyle.fill;
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Color _getColorForCategory(String categoryName) {
    switch (categoryName) {
      case 'Loyer':
        return Colors.blue;
      case 'Courses':
        return Colors.green;
      case 'Transport':
        return Colors.orange;
      case 'Loisirs':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}