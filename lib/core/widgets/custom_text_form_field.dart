import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../theme/color_pallete.dart';

class CustomTextFormField extends StatefulWidget {
  final bool isPassword;
  final Widget? prefixIcon;
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final void Function(String)? onFieldSubmitted;
final int? maxLines;
final int? miniLines;
final String? Function(String?)?validator;
  const CustomTextFormField({
    super.key,
     this.prefixIcon,
     this.hintText,
    this.textEditingController,
    this.onChanged,
    this.onFieldSubmitted,
    this.isPassword = false,
    this.miniLines,
    this.maxLines=1,
    this.validator
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  bool obscureText =true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      validator:widget.validator ,
      maxLines:widget.maxLines ,
      minLines:widget.miniLines ,
      obscureText:widget.isPassword? obscureText:false,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        suffixIcon:
        widget.isPassword?Bounceable(onTap: (){
          setState(() {
            obscureText = !obscureText;
          });
        }, child: obscureText?Icon(Icons.visibility_off,
        color: ColorPallete.grey,):Icon(Icons.visibility,
        color: ColorPallete.grey,)):null ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorPallete.grey, width: 2),
        ),
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyLarge!.copyWith(
          color: ColorPallete.grey
        ),
        helperStyle: theme.textTheme.bodyLarge!.copyWith(
          color: ColorPallete.grey,
        ),

        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.prefixIcon,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorPallete.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorPallete.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
