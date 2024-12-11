class Room {
  String name;
  String type;
  String status; // vcc: vacant clean, voc: vacant occupied

  Room({required this.name, required this.type, required this.status});

  // Static list of rooms
  static List<Room> rooms = [
    Room(name: 'Room 101', type: 'Single', status: 'vcc'),
    Room(name: 'Room 102', type: 'Double', status: 'vcc'),
    Room(name: 'Room 103', type: 'Suite', status: 'voc'),
    Room(name: 'Room 104', type: 'Double', status: 'vcc'),
    Room(name: 'Room 105', type: 'Suite', status: 'vcc'),
  ];
}
