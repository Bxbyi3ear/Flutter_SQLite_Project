import 'package:flutter/material.dart';
import 'package:sqlite/checkboxProduct.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Map<String, dynamic>> members = [
    {'memberID': 1, 'name': 'John'},
    {'memberID': 2, 'name': 'Jane'},
  ];

  Map<String, dynamic>? selectedMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สั่งสินค้า'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<Map<String, dynamic>>(
              hint: Text('รหัสสมาชิก - ชื่อสมาชิก'),
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
                  MaterialPageRoute(builder: (context) => checkbox(selectedMember: selectedMember!)),
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