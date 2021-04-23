
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

push(BuildContext context, Widget page) {
  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => page));
}

pushReplecment(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => page));
}

pushRemove(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => page),
      ModalRoute.withName('/'));
}

setH(double height, BuildContext context) {
  return (height * MediaQuery.of(context).size.height) / 812;
}

setW(double width, BuildContext context) {
  return (width * MediaQuery.of(context).size.width) / 375;
}

setToast(String msg) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
