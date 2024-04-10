import 'package:flutter/cupertino.dart';

class StaticData{
  void closeKeyboard(BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
  final List<Map<String,dynamic>> userDetails = [
    {
      'userName': 'tushar',
      'password': 'IamTushar',
    },
    {
      'userName': 'dineshSuthar',
      'password': 'IamDinesh',
    },
    {
      'userName': 'tusharPrajapati',
      'password': 'IamTushar',
    }
  ];
}
