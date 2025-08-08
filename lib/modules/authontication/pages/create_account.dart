import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/utils/firebase_auth_util.dart';
import 'package:evently/core/widgets/custom_button_style.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CreateAccount extends StatelessWidget {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
   CreateAccount({super.key});
   final TextEditingController _nameController=TextEditingController();

final TextEditingController _emailController=TextEditingController();
final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPallete.screenLight,
        centerTitle: true,
        title: Text("Register",style: theme.textTheme.titleLarge!.copyWith(
          color: ColorPallete.black,fontWeight: FontWeight.w500
        ),),
        iconTheme: IconThemeData(
          color: ColorPallete.black
        ),
      ),
      backgroundColor: ColorPallete.screenLight,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              children: [
                Image.asset(AppAssets.appLogo,width: 136,height: 186,),
                CustomTextFormField(
                  textEditingController: _nameController,
                  prefixIcon: Icon(Icons.person,color: ColorPallete.grey,),
                  hintText: "Name",
                  validator: (value){
                    if(value==null || value.isEmpty){
                        return "Please Enter Your Name";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  validator: (value){
                    final emailRegex=
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
                    );
                    if(value==null || value.isEmpty){
                      return "Please Enter Your Name";
                    }
                    if(!emailRegex.hasMatch(value)){
                      return "Please Enter a valid Email";
                    }
                    return null;
                  },
                  textEditingController: _emailController,
                  prefixIcon: Icon(Icons.email_sharp,color: ColorPallete.grey,),
                  hintText: "Email",
                ),
                CustomTextFormField(
                  validator: (value){
                    final passwordReg=RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$'
                        );
                    if(value==null || value.isEmpty){
                      return "Please Enter Your Name";
                    }
                    if(!passwordReg.hasMatch(value)){
                      return "Please Enter a valid Password";
                    }
                    return null;
                  },
                  textEditingController: _passwordController,
                  prefixIcon: Icon(Icons.enhanced_encryption_rounded,color: ColorPallete.grey,),
                  hintText: "Password",
                  isPassword: true,
                ),
                CustomTextFormField(
                  prefixIcon: Icon(Icons.enhanced_encryption_rounded,color: ColorPallete.grey,),
                  hintText: "Re-Password",
                  isPassword: true,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please Enter Your Name";
                    }
                    if(value !=_passwordController.text){
                      return "Password doesn't match";
                    }
                    return null;
                  },
                ),
                CustomButtonStyle(color: ColorPallete.primaryColor,child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Text("Create Account",style: theme.textTheme.titleLarge!.copyWith(
                    color: ColorPallete.white
                  ),),
                ),
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    EasyLoading.show();
                    FirebaseAuthUtil.createUserWithEmailandpass(email: _emailController.text,
                        password: _passwordController.text).then((value) {
                          EasyLoading.dismiss();
                          if(value){
                            Navigator.pop(context);
                          }
                        },);
                  }
                },),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have Account ?  "),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
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
                )
            
              ],
            ),
          ),
          ] ),
      ),
    );
  }
}
