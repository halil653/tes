import 'package:flutter/material.dart';

class GuestInHouse {
  static List<Map<String, String>> guestList = [];
}

class GuestInHousePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest In House'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GuestInHouse.guestList.isEmpty
            ? Center(
                child: Text(
                  'No Guests Checked In',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: GuestInHouse.guestList.length,
                itemBuilder: (context, index) {
                  final guest = GuestInHouse.guestList[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${guest['name']} (${guest['room']})',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Check-In: ${guest['checkIn']}\nCheck-Out: ${guest['checkOut']}',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.hotel, color: Colors.blueAccent),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
