// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mob3_login_107_halil/ui/availabel.dart';
import 'package:mob3_login_107_halil/ui/check_out.dart';
import 'package:mob3_login_107_halil/ui/guest.dart';
import 'package:mob3_login_107_halil/ui/login.dart';
import 'package:mob3_login_107_halil/ui/reservasi.dart';
import 'package:mob3_login_107_halil/ui/room_page.dart';
import 'package:mob3_login_107_halil/widget/bookcard.dart';
import 'package:mob3_login_107_halil/widget/dashboardcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>LoginScreen() ));
                 //FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
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
                'NAMA TOKO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Reservasi '),
              onTap: () {Navigator.push(
             context,
              MaterialPageRoute(
             builder: (context) => ReservasiPage (),
    ),
  );
  },
            ),
            
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Guest-in House'),
              onTap: () {Navigator.push(
             context,
              MaterialPageRoute(
             builder: (context) => GuestInHousePage(),
    ),
  );
  },
            ),ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Check-Out'),
              onTap: () {Navigator.push(
             context,
              MaterialPageRoute(
             builder: (context) => CheckOutPage(),
    ),
  );
  },
            ),
            ListTile(
              leading: Icon(Icons.money_rounded),
              title: Text('Availability'),
             onTap: () {Navigator.push(
             context,
              MaterialPageRoute(
             builder: (context) => AvailabilityPage (),
    ),
  );
  },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('ROOM '),
              onTap: () {Navigator.push(
             context,
              MaterialPageRoute(
             builder: (context) =>RoomPage (),
    ),
  );
  },
            ),
            ListTile(
              leading: Icon(Icons.report_sharp),
              title: Text('LAPORAN'),
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