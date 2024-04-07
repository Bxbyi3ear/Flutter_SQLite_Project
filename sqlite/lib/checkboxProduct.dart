import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {
  final Map<String, dynamic> selectedMember;

  checkbox({required this.selectedMember});

  @override
  _checkboxState createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  // รายการสินค้า
  List<Map<String, dynamic>> products = [
    {'productCode': 'A001', 'productName': 'Product A', 'price': 100},
    {'productCode': 'B001', 'productName': 'Product B', 'price': 150},
    // เพิ่มรายการสินค้าเพิ่มเติมตามต้องการ
  ];

  // สินค้าที่ถูกเลือก
  Map<String, dynamic>? selectedProduct;

  // จำนวนที่ต้องการ
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกสินค้า'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${products[index]['productName']} - ${products[index]['price']} บาท',
            ),
            trailing: Checkbox(
              value: selectedProduct == products[index],
              onChanged: (bool? value) {
                setState(() {
                  if (value != null && value) {
                    selectedProduct = products[index];
                  } else {
                    selectedProduct = null;
                  }
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: selectedProduct != null
          ? Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('จำนวน:'),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                quantity = quantity > 1 ? quantity - 1 : quantity;
                              });
                            },
                          ),
                          Text(quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity += 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // แสดงรายละเอียดสรุปของสินค้าที่เลือกและจำนวนที่เลือก
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('สรุปรายการสั่งซื้อ'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text(
                                    'สมาชิก: ${widget.selectedMember['name']}',
                                  ),
                                  Text(
                                    'สินค้า: ${selectedProduct!['productName']}',
                                  ),
                                  Text(
                                    'ราคา: ${selectedProduct!['price']}',
                                  ),
                                  Text(
                                    'จำนวน: $quantity',
                                  ),
                                  Text(
                                    'ราคารวม: ${selectedProduct!['price'] * quantity}',
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('ยกเลิก'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('ยืนยัน'),
                                onPressed: () {
                                  // ทำการบันทึกข้อมูลสั่งซื้อ
                                  // โดยสามารถเพิ่มเข้าไปใน List ของรายการสั่งซื้อได้ตามต้องการ
                                  // จากนั้นปิด dialog และกลับไปหน้าแรก
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('สั่งซื้อ'),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
