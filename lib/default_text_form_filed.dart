import 'package:flutter/material.dart';

class DefaultTextFormFiled extends StatelessWidget {
  TextEditingController controller ;
  String? Function(String?)? validator;
  String? labelText;
  String? hint ;
  IconData ?icon;
  Widget? suffix;

   DefaultTextFormFiled({super.key ,
     required this.controller,
     required this.validator,
     this.labelText,
     this.hint,
     this.icon,
     this.suffix,
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hint,
       // suffixIcon: Icon(icon)
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      ),
    );
  }
}
