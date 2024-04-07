import 'package:flutter/material.dart';

class OrderSummaryPage extends StatelessWidget {
  final String poid;
  final String memberId;
  final String memberName;
  final List<Map<String, dynamic>> orderDetails;
  final int totalAmount;

  OrderSummaryPage({
    required this.poid,
    required this.memberId,
    required this.memberName,
    required this.orderDetails,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สรุปยอดสั่งซื้อ'),
      ),
      body: ListView.builder(
        itemCount: orderDetails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('POID: $poid'),
                Text('Member ID: $memberId'),
                Text('Member Name: $memberName'),
                Text('Product Name: ${orderDetails[index]['productName']}'),
                Text('Price: ${orderDetails[index]['price']}'),
                Text('Quantity: ${orderDetails[index]['quantity']}'),
                Text('Total Price: ${orderDetails[index]['price'] * orderDetails[index]['quantity']}'),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Total Amount: $totalAmount',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
