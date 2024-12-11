import 'package:flutter/material.dart';

import 'package:mob3_login_107_halil/widget/bookcard.dart';
import 'package:mob3_login_107_halil/widget/dashboardcard.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistem Automasi PSS'),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'HDA Integrated Solution',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Mengenai S-Lib'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.rule),
              title: Text('Terma dan Syarat'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.subscriptions),
              title: Text('Langganan'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Manual Pengguna'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardCard(value: '150', title: 'New Orders', color: Colors.blue),
                  DashboardCard(value: '53%', title: 'Data Barang', color: Colors.green),
                  DashboardCard(value: '44', title: 'Data Penjualan', color: Colors.orange),
                  DashboardCard(value: '65', title: 'User Registrations', color: Colors.red),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Senarai Buku Terkini',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              BookCard(
                title: 'ECOLOGY',
                author: 'STEVEN',
                year: 'BELITHA, 1997',
                callNumber: '080 JUL',
                classification: 'Karya Am',
                status: 'Ada',
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}