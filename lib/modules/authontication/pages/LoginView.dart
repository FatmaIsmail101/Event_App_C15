import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:evently/core/widgets/custom_button_style.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 30),
              Image(
                image: AssetImage(AppAssets.appLogo),
                height: 186,
                width: 136,
              ),
              CustomTextFormField(
                hintText: "Email",
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.email),
                  color: ColorPallete.grey,
                ),

              ),

              CustomTextFormField(
                isPassword: true,
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.password),
                  color: ColorPallete.grey,
                ),
                hintText: "Password",

              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(


                   onPressed: () {  }, child: Text("Forget password ?",style: theme.textTheme.bodyLarge!.copyWith(
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                color: ColorPallete.primaryColor,
                fontWeight: FontWeight.bold,),
                ),
              ),),
              SizedBox(
                width: double.infinity,
                child: CustomButtonStyle(child: Text("Login",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white
                ),),onTap: (){},),
              ),
              Row(
                children: [
                  Text(
                    " Don’t Have Account ?",
                    style: theme.textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Create Account ",
                      style: theme.textTheme.bodyLarge!.copyWith(
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
                    "Or",
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
                child: CustomButtonStyle(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(AppAssets.google),
                    ),
                    Text("Login With Google",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: ColorPallete.primaryColor
                      ),),
                  ],
                ),onTap: (){},color: Colors.white,),
              ),

              Container(
                width: 73.28,
                height: 30.76,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff5669FF)),
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red, Colors.white, Colors.blue],
                          stops: [0.0, 0.5, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: ImageIcon(AssetImage(AppAssets.en)),
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red, Colors.white, Colors.black],
                          stops: [0.0, 0.5, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: ImageIcon(AssetImage(AppAssets.ar)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
