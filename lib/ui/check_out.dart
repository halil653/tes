import 'package:flutter/material.dart';
import 'package:mob3_login_107_halil/ui/guest.dart';


class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  void checkOutGuest(int index) {
    setState(() {
      GuestInHouse.guestList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Guest has been checked out successfully.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check-Out')),
      body: GuestInHouse.guestList.isEmpty
          ? Center(child: Text('No guests to check out.'))
          : ListView.builder(
              itemCount: GuestInHouse.guestList.length,
              itemBuilder: (context, index) {
                final guest = GuestInHouse.guestList[index];
                return ListTile(
                  title: Text('${guest['name']} (${guest['room']})'),
                  subtitle: Text('Check-In: ${guest['checkIn']} | Check-Out: ${guest['checkOut']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.logout, color: Colors.red),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Confirm Check-Out'),
                        content: Text('Are you sure you want to check out this guest?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              checkOutGuest(index);
                            },
                            child: Text('Check-Out'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
