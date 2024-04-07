import 'package:flutter/material.dart';

class SelectProductsScreen extends StatefulWidget {
  const SelectProductsScreen({super.key});

  @override
  State<SelectProductsScreen> createState() => _SelectProductsScreenState();
}

class _SelectProductsScreenState extends State<SelectProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เลือกสินค้า'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [Text("รหัสสมาชิก: 00000000000")],
              ),
              Row(
                children: [
                  Text("Po No: 00000000000 วันที่: ${DateTime.now().toLocal()}")
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 250,
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text('Product ${index} - 100 บาท'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("ราคา 100 บาท x"),
                              SizedBox(
                                width: 50, // Example width for the TextField
                                child: TextField(
                                  decoration:
                                      const InputDecoration(hintText: 'จำนวนสินค้า'),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    print(value);
                                  },
                                ),
                              ),
                              Text(" = 100 บาท")
                            ],
                          )),
                    );
                  },
                ),
              ),
              // button max width
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('บันทึก'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
