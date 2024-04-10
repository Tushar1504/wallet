import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallet/home_screen/home_screen.dart';
import 'package:wallet/utils/static_data.dart';

import '../utils/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isValidUserName = true;
  bool isValidPassword = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginPage(),
    );
  }

  Widget loginPage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logo/gg.jpg',
                scale: 7,
              )),
          SizedBox(
            height: 10,
          ),
          Text('Welcome to GG Wallet'),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username or Email Id',
              labelStyle: TextStyle(color: Colors.grey.shade700),
              counterText: '',
            ),
            maxLength: 16,
            controller: userNameController,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.grey.shade700),
              counterText: '',
            ),
            controller: passwordController,
            maxLength: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(
                            context, Strings.forgotPasswordScreen);
                      });
                    },
                    child: Text(
                      'forgot password !',
                      style: TextStyle(color: Colors.red),
                    )),
                SizedBox(
                  width: 10,
                ),
                Text('|'),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      StaticData().closeKeyboard(context);
                      Navigator.pushNamed(context, Strings.signUpScreen);
                    });
                  },
                  child: Text(
                    'New Register',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo.shade800),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              // isValidUserName = ((userNameController.text.length <= 16) &&
              //     (userNameController.text.length >= 6));
              // isValidPassword = ((passwordController.text.length <= 12) &&
              //     (passwordController.text.length >= 7));
              // (isValidUserName && isValidPassword)
              //     ? Navigator.pushNamed(context, Strings.homeScreen)
              //     : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //         content: Text(
              //           'Please enter valid username or password!!!',
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         backgroundColor: Colors.red,
              //         showCloseIcon: true,
              //       ));
              if (GetStorage().read('userModel') != null) {
                if (GetStorage().read('userModel').name ==
                        userNameController.text &&
                    GetStorage().read('userModel').password ==
                        passwordController.text) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              } else if (StaticData().userDetails.any((element) =>
                  (element['userName'] == userNameController.text &&
                      element['password'] == passwordController.text))) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }
              setState(() {});
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.indigo.shade800),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
