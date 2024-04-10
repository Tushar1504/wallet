import 'package:flutter/material.dart';

class CreditDebitScreen extends StatefulWidget {
  const CreditDebitScreen({super.key});

  @override
  State<CreditDebitScreen> createState() => _CreditDebitScreenState();
}

class _CreditDebitScreenState extends State<CreditDebitScreen> {
  final List<Map<String, dynamic>> CreditDebitList = [
    {
      "text":
          "Debited Rs.30.00 from Kotak Bank AC X1310 to paytmqr1hemlslzcj@paytm on 04-03-24.UPI Ref 406409486280. Not you, kotak.com/fraud"
    },
    {
      "text":
          "Debited Rs.25.00 from Kotak Bank AC X1310 to paytmqr10kfimgfha@paytm on 01-03-24.UPI Ref 406156846311. Not you, kotak.com/fraud"
    },
    {
      "text":
          "Credited Rs.3000.00 in your Kotak Bank AC X1310 from 9624168700@paytm on 03-03-24.UPI Ref:442934348546."
    },
    {
      "text":
          "Debited Rs.4535.84 to Kotak Mahindra  - 1310 from your a/c. UPI Ref: 442707288472. Queries? Visit http://m.p-y.tm/care :PPBL."
    },
    {
      "text":
          "Debited Rs.80.00 from Kotak Bank AC X1310 to paytmqr1hemlslzcj@paytm on 04-03-24.UPI Ref 406409486280. Not you, kotak.com/fraud"
    },
    {
      "text":
          "Debited Rs.125.00 from Kotak Bank AC X1310 to paytmqr10kfimgfha@paytm on 01-03-24.UPI Ref 406156846311. Not you, kotak.com/fraud"
    },
    {
      "text":
          "Credited Rs.300.00 in your Kotak Bank AC X1310 from 9624168700@paytm on 03-03-24.UPI Ref:442934348546."
    },
    {
      "text":
          "Debited Rs.455.84 to Kotak Mahindra  - 1310 from your a/c. UPI Ref: 442707288472. Queries? Visit http://m.p-y.tm/care :PPBL."
    },
    {
      "text":
          "Debited Rs.130.00 from Kotak Bank AC X1310 to paytmqr1hemlslzcj@paytm on 04-03-24.UPI Ref 406409486280. Not you, kotak.com/fraud"
    },
    {
      "text":
          "Debited Rs.150.00 from Kotak Bank AC X1310 to paytmqr10kfimgfha@paytm on 01-03-24.UPI Ref 406156846311. Not you, kotak.com/fraud"
    },
    {
      "text":
          "Credited Rs.30.00 in your Kotak Bank AC X1310 from 9624168700@paytm on 03-03-24.UPI Ref:442934348546."
    },
    {
      "text":
          "Debited Rs.500.84 to Kotak Mahindra  - 1310 from your a/c. UPI Ref: 442707288472. Queries? Visit http://m.p-y.tm/care :PPBL."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Credit / Debit',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: creditDebit(),
      ),
    );
  }

  Widget creditDebit() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Credit / Debit history', 
          style: TextStyle(color: Colors.red),),
          SizedBox(height: 10,),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: CreditDebitList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                    child: Text('${CreditDebitList.elementAt(index)['text']}'),
                  ),
                );
              })
        ],
      ),
    );
  }
}
