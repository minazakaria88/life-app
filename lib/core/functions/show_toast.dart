 import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 showToast({required String message}){
   Fluttertoast.cancel();
   Fluttertoast.showToast(
       msg: message,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.TOP,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
   );
 }