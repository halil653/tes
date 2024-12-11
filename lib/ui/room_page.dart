import 'package:flutter/material.dart';
import 'room.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  void updateRoom(Room room, String field, String value) {
    setState(() {
      if (field == 'status') {
        room.status = value;
      } else if (field == 'type') {
        room.type = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Management'),
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
          itemCount: Room.rooms.length,
          itemBuilder: (context, index) {
            final room = Room.rooms[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(
                  Icons.hotel,
                  color: Colors.blueAccent,
                  size: 40,
                ),
                title: Text(
                  '${room.name}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: ${room.type}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        )),
                    Text('Status: ${room.status}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        )),
                  ],
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'Change Status') {
                      updateRoom(room, 'status', room.status == 'vcc' ? 'voc' : 'vcc');
                    } else if (value == 'Change Type') {
                      updateRoom(room, 'type', room.type == 'Single' ? 'Double' : 'Single');
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Change Status',
                      child: Text('Change Status'),
                    ),
                    PopupMenuItem(
                      value: 'Change Type',
                      child: Text('Change Type'),
                    ),
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