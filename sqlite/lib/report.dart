import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<Map<String, dynamic>> members = [
    {'memberID': 1, 'name': 'John'},
    {'memberID': 2, 'name': 'Jane'},
  ];

  Map<String, dynamic>? selectedMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ออกรายงาน'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<Map<String, dynamic>>(
              hint: Text('PO No'),
              value: selectedMember,
              onChanged: (Map<String, dynamic>? newValue) {
                setState(() {
                  selectedMember = newValue;
                });
              },
              items: members.map<DropdownMenuItem<Map<String, dynamic>>>((member) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: member,
                  child: Text('${member['memberID']} - ${member['name']}'),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportSelectionPage()),
                );
              },
              child: Text('ตกลง'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แสดงรายการสินค้า'),
      ),
    );
  }
}