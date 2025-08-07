import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
class SnackBarServices{
  static void showSucessMessage(String msg){
    BotToast.showCustomNotification(toastBuilder: (void Function()cancelFunc) {
      return Material(

        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.amberAccent
          ),
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 14),
          child: Text("The Event is created sucessfully",style: TextStyle(
            color: Colors.black
          ),),
        ),
      );
    },
        duration: const Duration(seconds: 5),
        dismissDirections: [DismissDirection.endToStart]
      ,);
  }

  static void showWarningMessage({required String msg, bool isLoginWarning=false}){
    BotToast.showCustomNotification(toastBuilder: (void Function()cancelFunc) {
      return Material(

        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.amberAccent
          ),
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 14),
          child: Text("The Event is created sucessfully",style: TextStyle(
              color: Colors.black
          ),),
        ),
      );
    },
      duration: const Duration(seconds: 5),
      dismissDirections: [DismissDirection.endToStart]
      ,);
  }

}