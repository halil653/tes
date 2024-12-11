import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String year;
  final String callNumber;
  final String classification;
  final String status;

  BookCard({
    required this.title,
    required this.author,
    required this.year,
    required this.callNumber,
    required this.classification,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Pengarang: $author'),
            Text('Terbitan: $year'),
            Text('No. Panggilan: $callNumber'),
            Text('Pengkelasan: $classification'),
            Text(
              'Status: $status',
              style: TextStyle(
                color: status == 'Ada' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}