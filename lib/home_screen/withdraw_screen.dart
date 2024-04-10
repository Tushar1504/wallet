import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  int walletBalance = 0;
  @override
  void initState() {
    walletBalance = GetStorage().read('walletBalance');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController balanceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'GG Wallet',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Current Balance:'),
                Text(walletBalance.toString())
              ],
            ),
            TextField(
              controller: balanceController,
              decoration: const InputDecoration(
                hintText: 'Enter Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: () {
                 walletBalance = walletBalance - int.parse(balanceController.text);
                 GetStorage().write('walletBalance', walletBalance);
                  setState(() {});
                },
                child: Text('Withdraw'))
          ],
        ),
      ),
    );
  }
}
