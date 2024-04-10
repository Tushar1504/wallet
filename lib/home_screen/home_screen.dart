import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallet/home_screen/withdraw_screen.dart';

import '../utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int walletBalance = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'GG Wallet',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(child: ggWallet()),
    );
  }

  Widget ggWallet() {
    TextEditingController balanceController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.black),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wallet Balance',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.account_balance_wallet_rounded,
                          color: Colors.black,
                        )
                      ],
                    ),
                    Text(
                      '₹ $walletBalance',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade400),
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Add Money',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: balanceController,
                              decoration: const InputDecoration(
                                hintText: '₹ 1000',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (balanceController.text != '') {
                                  walletBalance +=
                                      int.parse(balanceController.text);
                                }
                                GetStorage()
                                    .write('walletBalance', walletBalance);
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1, color: Colors.indigo.shade800),
                                  color: Colors.indigo.shade800,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Text(
                                    'ADD',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(
                                    context, Strings.transferBankScreen);
                              });
                            },
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.assured_workload_outlined,
                                  color: Colors.black,
                                ),
                                Container(
                                    width: 80,
                                    child:
                                        const Text('Tranfer to Bank or Self'))
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.qr_code_2,
                                color: Colors.black,
                              ),
                              Text('Scan & Pay'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(
                                    context, Strings.creditDebitScreen);
                              });
                            },
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  color: Colors.black,
                                ),
                                Text('Credit / Debit')
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WithdrawScreen())).then(
                  (value) {
                    return
                    setState(() {
                      walletBalance = GetStorage().read('walletBalance');
                    });
                  });
            },
            child: const Text('Withdraw')),
      ],
    );
  }
}

// Widget paymentScreen(int walletBalance) {
//   return Container(
//     child: Column(
//       children: [
//         Text('Pay Rs.$walletBalance'),
//         Row(
//           children: [
//             Expanded(
//                 child: TextField(
//               decoration: InputDecoration(),
//             )),
//             Expanded(
//                 child: TextField(
//               decoration: InputDecoration(),
//             )),
//             Expanded(
//                 child: TextField(
//               decoration: InputDecoration(),
//             )),
//             Expanded(
//                 child: TextField(
//               decoration: InputDecoration(),
//             )),
//           ],
//         )
//       ],
//     ),
//   );
// }
