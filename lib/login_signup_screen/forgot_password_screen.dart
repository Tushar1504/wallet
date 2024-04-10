import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  TextEditingController userNameController = TextEditingController();
  bool isforgotPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: forgotPasswordPage(),
    );
  }

  Widget forgotPasswordPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recive a reset password link here',
            style: TextStyle(color: Colors.red),
          ),
          TextField(
            controller: userNameController,
            decoration: InputDecoration(
                labelText: 'Please enter Username or Email-Id.',
                labelStyle: TextStyle(color: Colors.grey.shade700)),
                
          ),
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                  isforgotPassword = ((userNameController.text.length <= 16) &&
                      (userNameController.text.length >= 6));
                  setState(() {});
                  isforgotPassword
                      ? null
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text(
                            'Enter valid username or email-Id!!!',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                          showCloseIcon: true,
                        ));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.indigo.shade800),
                    color: Colors.indigo.shade800),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                  child: Text(
                    'Send passord reset link',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
