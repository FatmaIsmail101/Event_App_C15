import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/routes/page_routes_name.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/widgets/custom_button_style.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/firebase_auth_util.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  bool isVisible = false;
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              key: _globalKey,

              child: Column(
                spacing: 16,
                children: [
                  Image(
                    image: AssetImage(AppAssets.appLogo),
                    height: 186,
                    width: 136,
                  ),
                  CustomTextFormField(
                    hintText: "email".tr(),
                    prefixIcon: ImageIcon(
                      AssetImage(AppAssets.email),
                      color: ColorPallete.grey,
                    ),
                    textEditingController: _emailController,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "Please Enter Email";
                      }
                      return null;
                    },
                  ),

                  CustomTextFormField(
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "Please Enter Password";
                        //todo:pass: 1234@#Fatma
                        //todo:email: fatma@gmail.com

                      }
                      return null;
                    },

                    textEditingController: _passwordController,
                    isPassword: true,
                    prefixIcon: ImageIcon(
                      AssetImage(AppAssets.password),
                      color: ColorPallete.grey,
                    ),
                    hintText: "password".tr(),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                         Navigator.pushNamed(context, PageRoutesName.restPass);
                      },
                      child: Text(
                        "forget_password".tr(),
                        style: theme.textTheme.bodyLarge!.copyWith(
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          color: ColorPallete.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButtonStyle(
                      child: Text(
                        "login".tr(),
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        if(_globalKey.currentState!.validate()){
                          EasyLoading.show();
                          FirebaseAuthUtil.signInWithEmailandPassword(
                              password: _passwordController.text, email: _emailController.text).then((value) {
                            EasyLoading.dismiss();
                            if(value){
                            }
                            Navigator.pushNamed(context, PageRoutesName.layout);

                          },);
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "dont_have".tr(),
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PageRoutesName.createAccount);
                        },
                        child: Text(
                          "create_acc".tr(),
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                            color: ColorPallete.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: ColorPallete.primaryColor,
                          endIndent: 20,
                          indent: 20,
                          thickness: 2,
                        ),
                      ),
                      Text(
                        "or".tr(),
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: ColorPallete.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: ColorPallete.primaryColor,
                          endIndent: 2,
                          indent: 20,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButtonStyle(
                      heroTag: "login",
                      onTap: () {
                        FirebaseAuthUtil.loginWithGoogle(context);
                      },
                     color: ColorPallete.screenLight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(AppAssets.google,width: 26,height: 26,),
                          ),
                          Text(
                            "login_with_google".tr(),
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: ColorPallete.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Container(
                      width: 74.w,height: 31.h,
                      decoration:
                      BoxDecoration(
                          border: Border.all(color: ColorPallete.primaryColor,
                              width: 3,style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.r)
                      ),
                      child: Row(

                        children: [
                          Bounceable(
                            onTap: (){
                              context.setLocale(Locale('en'));

                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorPallete.primaryColor,
                                        width: 3.r,style: context.locale.toString()=="en"?
                                        BorderStyle.solid:BorderStyle.none),
                                    borderRadius: BorderRadius.circular(35.r)
                                ),
                                child: Image.asset(AppAssets.en)),
                          ),
                          Spacer(),
                          Bounceable(
                            onTap: (){
                              context.setLocale(Locale('ar'));

                            },
                            child: Container(
                                width: 30.w,
                                decoration:  BoxDecoration(

                                    border: Border.all(color: ColorPallete.primaryColor,
                                        width: 3.r,style: context.locale.toString()=="ar"?
                                        BorderStyle.solid:BorderStyle.none),
                                    borderRadius: BorderRadius.circular(35.r)
                                ),
                                child: Image.asset(AppAssets.ar)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
