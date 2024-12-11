import 'package:flutter/material.dart';
import 'reservasi.dart';
import 'room.dart';

class AvailabilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Room> availableRooms = Room.rooms.where((room) => room.status == 'vcc').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Available Rooms'),
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
        child: ListView.builder(
          itemCount: availableRooms.length,
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final room = availableRooms[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReservasiPage()),
                );
              },
              child: Card(
                elevation: 6,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent.shade100, Colors.blueAccent.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.hotel,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${room.name}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Type: ${room.type}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Status: ${room.status}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}