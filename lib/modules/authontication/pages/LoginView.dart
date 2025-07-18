import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 30,),
              Image(image: AssetImage(AppAssets.appLogo),
              height: 186,width: 136,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    helperStyle: theme.textTheme.bodyLarge!.copyWith(
                      color: ColorPallete.grey
                    ),
                    prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(AssetImage(AppAssets.email)),

                ),
                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: ColorPallete.grey)
                  ),
                  focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorPallete.grey)
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  helperStyle: theme.textTheme.bodyLarge!.copyWith(
                      color: ColorPallete.grey
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye_rounded),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(AssetImage(AppAssets.password)),

                  ),
                  enabledBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorPallete.grey)
                  ),
                  focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorPallete.grey)
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text("Forget password ?",
                style: theme.textTheme.bodyLarge!.copyWith(
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic
                      ,color: ColorPallete.primaryColor
                    ,fontWeight: FontWeight.bold

                ),),
              ),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(

                  onPressed: (){}
                ,
                backgroundColor: ColorPallete.primaryColor,child: Text("Login",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white
                  ),),),
              ),
              Row(
                children: [
                  Text(" Don’t Have Account ?",
                  style: theme.textTheme.bodyLarge,),
                  TextButton(onPressed: (){}, child: Text("Create Account ",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic
                  ,color: ColorPallete.primaryColor
                  ,fontWeight: FontWeight.bold

                  )))
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
                  Text("Or",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: ColorPallete.primaryColor
                  ),),
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
                child: FloatingActionButton(

                  onPressed: (){}
                  ,
                  backgroundColor: theme.primaryColor,child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds){
                          return LinearGradient(begin:
                          Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.red,
                              Colors.yellow,
                              Colors.green,
                              Colors.blue],
                            stops: [0.0,0.5,0.5,0.5],).createShader(bounds);

                        },
                        blendMode: BlendMode.srcATop,
                        child: ImageIcon(AssetImage(AppAssets.google),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("  Login With Google",
                        style: theme.textTheme.bodyLarge!.copyWith(
                            color: ColorPallete.primaryColor
                                ,fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                    ],
                  ),),
              ),

              Container(
                width: 73.28,height: 30.76,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff5669FF)
                  ,),borderRadius: BorderRadius.circular(70)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
                        shaderCallback: (Rect bounds){
                          return LinearGradient(begin:
                          Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red,
                          Colors.white,
                          Colors.blue],
                          stops: [0.0,0.5,1.0],).createShader(bounds);

                        },
                        blendMode: BlendMode.srcATop,
                        child: ImageIcon(AssetImage(AppAssets.en))),
                    ShaderMask(
                        shaderCallback: (Rect bounds){
                          return LinearGradient(begin:
                          Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.red,
                              Colors.white,
                              Colors.black],
                            stops: [0.0,0.5,1.0],).createShader(bounds);

                        },
                        blendMode: BlendMode.srcATop,
                        child: ImageIcon(AssetImage(AppAssets.ar))),

                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}