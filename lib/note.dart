import 'package:flutter/material.dart';

class Note {
  String id;
  var picture;
  String time;
  String name;
  String address;
  String attendance;
  String host;

  Note({
    required this.id,
    required this.picture,
    required this.time,
    required this.name,
    required this.address,
    required this.attendance,
    required this.host
  });

  static List<Note> SCRIPT = [
    Note(id: "2023-09-24-A",
        picture: Icons.directions_run,
        time: "09:00",
        name: "Community Serving",
        address: "480 Northbourne Avenue, Dickson ACT 2602",
        attendance: "Compulsory (Must)",
        host: "TAYLOR, Louise"),

    Note(id: "2023-09-24-B",
        picture: Icons.settings_phone,
        time: "11:00",
        name: "Court meeting",
        address: "4 Knowles Pl, Canberra ACT 2601",
        attendance: "Compulsory (Must)",
        host: "LUKIN, Lionel Oscar"),

    Note(id: "2023-10-16-A",
        picture: Icons.public,
        time: "13:00",
        name: "Farm Serving",
        address: "2 Dairy Rd, Fyshwick ACT 2609",
        attendance: "Optional (Free)",
        host: "O'SULLIVAN, Patrick"),

    Note(id: "2023-12-11-A",
        picture: Icons.emoji_transportation,
        time: "09:30",
        name: "Traffic Conducting",
        address: "111 Alinga St, Canberra ACT 2601",
        attendance: "Optional (Free)",
        host: "HULME, Robert"),

    Note(id: "2023-12-11-B",
        picture: Icons.emoji_transportation,
        time: "10:30",
        name: "Traffic Conducting",
        address: "111 Alinga St, Canberra ACT 2601",
        attendance: "Optional (Free)",
        host: "HULME, Robert"),

    Note(id: "2023-12-11-C",
        picture: Icons.emoji_transportation,
        time: "11:30",
        name: "Traffic Conducting",
        address: "111 Alinga St, Canberra ACT 2601",
        attendance: "Optional (Free)",
        host: "HULME, Robert"),

    Note(id: "2023-12-11-D",
        picture: Icons.emoji_transportation,
        time: "12:30",
        name: "Traffic Conducting",
        address: "111 Alinga St, Canberra ACT 2601",
        attendance: "Optional (Free)",
        host: "HULME, Robert"),

    Note(id: "2023-12-11-E",
        picture: Icons.emoji_transportation,
        time: "13:30",
        name: "Traffic Conducting",
        address: "111 Alinga St, Canberra ACT 2601",
        attendance: "Optional (Free)",
        host: "HULME, Robert"),

  ];
}