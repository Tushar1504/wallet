// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallet/utils/user_model.dart';

import '../utils/constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController mailIdController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  String _email = "";
  String _password = "";

  void _handleSignUp() async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: _email, password: _password);
      print("User Registered : ${userCredential.user!.email}");
    } catch (e) {
      print("Error during Registration: $e");
    }
  }

  bool isName = true;
  bool isMobile = true;
  bool isMailId = true;
  bool isPan = true;
  bool isPassword = true;
  bool isRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: signUpPage()),
    );
  }

  Widget signUpPage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              'assets/logo/gg.jpg',
              scale: 8,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Welcome to GG Wallet'),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter Your Name',
                labelStyle: TextStyle(color: Colors.grey.shade700),
                counterText: '',
              ),
              maxLength: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                labelText: 'Enter Your phone no.',
                labelStyle: TextStyle(color: Colors.grey.shade700),
                counterText: '',
              ),
              keyboardType: TextInputType.phone,
              maxLength: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: mailIdController,
              decoration: InputDecoration(
                labelText: 'Enter Your mail id',
                labelStyle: TextStyle(color: Colors.grey.shade700),
                hintText: 'xyz123@gmail.com',
                hintStyle: TextStyle(color: Colors.grey.shade700),
                counterText: '',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid email';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              maxLength: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: panController,
              decoration: InputDecoration(
                labelText: 'Enter Your PAN No.',
                labelStyle: TextStyle(color: Colors.grey.shade700),
                hintText: 'BWKPT1212L',
                hintStyle: TextStyle(color: Colors.grey.shade700),
                counterText: '',
              ),
              maxLength: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                labelStyle: TextStyle(color: Colors.grey.shade700),
                counterText: '',
              ),
              maxLength: 15,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: repasswordController,
              decoration: InputDecoration(
                labelText: 'Re-Confirm Password',
                labelStyle: TextStyle(color: Colors.grey.shade700),
                counterText: '',
              ),
              maxLength: 15,
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                GetStorage().write(
                    'userModel',
                    UserModel(
                        name: nameController.text,
                        mailId: mailIdController.text,
                        panNo: panController.text,
                        password: passwordController.text,
                        phoneNumber: int.parse(mobileController.text)));
                if (_formKey.currentState!.validate()) {
                  _handleSignUp();
                }
                isName = ((nameController.text.length <= 20) &&
                    (nameController.text.length >= 0));
                isMobile = ((mobileController.text.length <= 10) &&
                    (mobileController.text.length >= 0));
                isMailId = ((mailIdController.text.length <= 20) &&
                    (mailIdController.text.length >= 0));
                isPan = ((panController.text.length <= 10) &&
                    (nameController.text.length >= 0));
                isPassword = ((passwordController.text.length <= 15) &&
                    (passwordController.text.length >= 7));
                isRePassword = ((repasswordController.text.length <= 15) &&
                    (repasswordController.text.length >= 7));
                setState(() {});
                (isName &&
                        isPassword &&
                        isMailId &&
                        isMobile &&
                        isPan &&
                        isRePassword)
                    ? Navigator.pushNamedAndRemoveUntil(
                        context, Strings.loginScreen, (route) => false)
                    : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Please enter valid Details !!!',
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
