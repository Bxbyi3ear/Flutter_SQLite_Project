import 'package:flutter/material.dart';

class SelectPoScreen extends StatefulWidget {
  const SelectPoScreen({super.key});

  @override
  State<SelectPoScreen> createState() => _SelectPoScreenState();
}

class _SelectPoScreenState extends State<SelectPoScreen> {
  List<Map<String, dynamic>> po = [
    {'poId': 1, 'name': '0001'},
    {'poId': 2, 'name': '0002'},
  ];
  Map<String, dynamic>? selectedPo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เลือกPO'),
      ),
      body: Column(
        children: [DropdownButton<Map<String, dynamic>>(
              hint: Text('รหัสสมาชิก - ชื่อสมาชิก'),
              value: selectedPo,
              onChanged: (Map<String, dynamic>? newValue) {
                setState(() {
                  selectedPo = newValue;
                });
              },
              items: po.map<DropdownMenuItem<Map<String, dynamic>>>((member) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: member,
                  child: Text('${member['poId']} - ${member['name']}'),
                );
              }).toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('ตกลง'),
            ),],
      ),
    );
  }
}