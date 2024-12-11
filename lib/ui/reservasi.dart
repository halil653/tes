import 'package:flutter/material.dart';
import 'package:mob3_login_107_halil/ui/guest.dart';
import 'room.dart';

class ReservasiPage extends StatefulWidget {
  @override
  _ReservasiPageState createState() => _ReservasiPageState();
}

class _ReservasiPageState extends State<ReservasiPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? checkIn;
  DateTime? checkOut;
  Room? selectedRoom;
  String? name, address, phone;

  void saveReservation() {
    if (selectedRoom != null && checkIn != null && checkOut != null) {
      GuestInHouse.guestList.add({
        'name': name!,
        'address': address!,
        'phone': phone!,
        'room': selectedRoom!.name,
        'type': selectedRoom!.type,
        'checkIn': checkIn!.toLocal().toString().split(' ')[0],
        'checkOut': checkOut!.toLocal().toString().split(' ')[0],
      });
      setState(() {
        selectedRoom!.status = 'voc';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservasi'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade100, Colors.indigo.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reservasi Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onSaved: (value) => name = value,
                            validator: (value) => value!.isEmpty ? 'Enter a name' : null,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onSaved: (value) => address = value,
                            validator: (value) => value!.isEmpty ? 'Enter an address' : null,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onSaved: (value) => phone = value,
                            validator: (value) => value!.isEmpty ? 'Enter a phone number' : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Available Rooms:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: Room.rooms.where((room) => room.status == 'vcc').map((room) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRoom = room;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.all(16),
                            width: 160,
                            decoration: BoxDecoration(
                              color: selectedRoom == room
                                  ? Colors.indigo
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: selectedRoom == room ? Colors.white : Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  room.type,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: selectedRoom == room ? Colors.white70 : Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Status: ${room.status}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: selectedRoom == room ? Colors.white70 : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Select Check-In Date:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      checkIn == null ? 'Select Date' : checkIn!.toLocal().toString().split(' ')[0],
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => checkIn = picked);
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Select Check-Out Date:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      checkOut == null ? 'Select Date' : checkOut!.toLocal().toString().split(' ')[0],
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => checkOut = picked);
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Save Reservation',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        saveReservation();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Reservation Saved')),
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
