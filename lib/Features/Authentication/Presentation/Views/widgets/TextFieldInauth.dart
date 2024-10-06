import 'package:flutter/material.dart';

class Textfieldinauth extends StatelessWidget {
  const Textfieldinauth({super.key, required this.title, required this.control,this.bol=false, this.validator, this.keyType, this.preicon, this.sufficon});
final String title;
final TextEditingController control;
final bool bol;
final String? Function(String?)? validator;
  final TextInputType? keyType;
  final Widget? preicon;
    final Widget? sufficon;
  @override
  Widget build(BuildContext context) {
    return Container(
    child: TextFormField(
      obscureText: bol,
      keyboardType:keyType ,
  enableSuggestions: true,
      controller: control,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
              filled: true,
        hintText: title,
        suffixIcon: sufficon,
        prefixIcon: preicon,
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(10),),
        
      ),
    ),
    );
  }
}