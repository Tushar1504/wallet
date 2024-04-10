import 'package:flutter/material.dart';

class TransferToBankScreen extends StatefulWidget {
  const TransferToBankScreen({super.key});

  @override
  State<TransferToBankScreen> createState() => _TransferToBankScreenState();
}

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  List<String> items = [
    'Axis Bank',
    'Bank of Baroda',
    'Bank of India',
    'Canara Bank',
    'Central Bank of India'
        'Federal Bank',
    'HDFC Bank',
    'ICIC Bank',
    'IDBI Bank',
    'Indian Bank',
    'Punjab National Bank',
    'Kotak Mahindra Bank',
    'RBL Bank'
        'State Bank of India',
    'Yes Bank',
  ];
  String? selectedItem;

  var name1 = Text('Terms of Services');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Transfer to Bank or Self',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: tansferBankScreen(),
      ),
    );
  }

  Widget tansferBankScreen() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Money to Bank',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                labelText: 'Select Bank',
                hintText: 'Select Your Bank',
                hintStyle: TextStyle(color: Colors.grey.shade700),
                labelStyle: TextStyle(color: Colors.grey.shade700)),
            value: selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue;
              });
            },
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(color: Colors.grey.shade900),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Enter Account Holder Name',
                        labelStyle: TextStyle(color: Colors.grey.shade700)),
                  ),
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'Enter Account Number',
                        labelStyle: TextStyle(color: Colors.grey.shade700)),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'Re-Enter Account Number',
                        labelStyle: TextStyle(color: Colors.grey.shade700)),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter IFSC Code',
                    labelStyle: TextStyle(color: Colors.grey.shade700)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey.shade600),
                      color: Colors.grey.shade600,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This information will be securely saved as per GG Wallet Terms of Services and Privacy Policy.',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
