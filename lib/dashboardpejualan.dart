import 'package:flutter/material.dart';

void main() {
  runApp(SalesDashboardApp());
}

class SalesDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SalesDashboardPage(),
    );
  }
}

class SalesDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Penjualan'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ringkasan Penjualan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SalesCard(
                  title: 'Penjualan Harian',
                  value: 'Rp 5,000,000',
                  color: Colors.green,
                ),
                SalesCard(
                  title: 'Penjualan Bulanan',
                  value: 'Rp 150,000,000',
                  color: Colors.orange,
                ),
                SalesCard(
                  title: 'Penjualan Tahunan',
                  value: 'Rp 1,800,000,000',
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Detail Penjualan Harian',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  SalesDetailCard(
                    date: '8 Desember 2024',
                    sales: 'Rp 2,000,000',
                    transactions: 20,
                  ),
                  SalesDetailCard(
                    date: '7 Desember 2024',
                    sales: 'Rp 3,000,000',
                    transactions: 25,
                  ),
                  SalesDetailCard(
                    date: '6 Desember 2024',
                    sales: 'Rp 4,500,000',
                    transactions: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const SalesCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: color),
          ),
        ],
      ),
    );
  }
}

class SalesDetailCard extends StatelessWidget {
  final String date;
  final String sales;
  final int transactions;

  const SalesDetailCard({
    required this.date,
    required this.sales,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.calendar_today, color: Colors.blue),
        title: Text(date),
        subtitle: Text('Penjualan: $sales\nTransaksi: $transactions'),
      ),
    );
  }
}
