import 'package:con_nected/Help/DriverLicenseInfo.dart';
import 'package:flutter/material.dart';

class DocumentDetail extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'title': 'Driver License', 'icon': Icons.drive_eta, 'color': Colors.red},
    {'title': 'ID', 'icon': Icons.perm_identity, 'color': Colors.blue},
    {'title': 'Medical Card', 'icon': Icons.medical_services, 'color': Colors.green},
    {'title': 'Bank Card', 'icon': Icons.account_balance_wallet, 'color': Colors.purple},
    {'title': 'Transport Card', 'icon': Icons.train, 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document Details"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Welcome to Document Details"),
                    content: Text("Welcome to check the list of your document details. Click the bar below and the corresponding file will pop up."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _buildItem(context, items[index]);
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      shadowColor: item['color'],
      child: InkWell(
        onTap: () {
          if (item['title'] == "Driver License") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DriverLicenseInfo()),
            );
          } else {
            print("${item['title']} tapped");
          }
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: item['color'],
            child: Icon(item['icon'], color: Colors.white),
          ),
          title: Text(
            item['title'],
            style: TextStyle(
              color: item['color'],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
