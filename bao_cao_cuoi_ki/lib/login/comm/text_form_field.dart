
import 'package:bao_cao_cuoi_ki/login/helper/helper_fuction.dart';
import 'package:flutter/material.dart';

class TextFormFieldLogIn extends StatelessWidget {
  TextFormFieldLogIn({
    super.key,
    required this.hintname,
    required this.icon,
    this.isobscureText = false,
    required this.controller,
    this.inputType = TextInputType.text,
  });
  String hintname;
  IconData icon;
  bool isobscureText;
  TextEditingController controller;
  TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          prefixIcon: Icon(icon),
          hintText: hintname,
          labelText: hintname,
          fillColor: Colors.grey[200],
          filled: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Plase Enter $hintname';
          }
          //kiem tra dieu kien email
          if (hintname == "user" && !validateEmail(value)) {
            return 'Vui lòng nhập lại email';
          }
          return null;
        },
        keyboardType: inputType,
        obscureText: isobscureText,
      ),
    );
  }
}
