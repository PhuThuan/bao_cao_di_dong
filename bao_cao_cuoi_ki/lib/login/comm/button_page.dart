import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  ButtonPage({
    super.key,
    required this.title,
    required this.colorBotton,
    required this.colorText,
    required this.colorBorder,
    required this.Onpressed,
  });
  String title;
  Color colorBotton;
  Color colorText;
  Color colorBorder;
  Function Onpressed;
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, // hoverground
          backgroundColor: colorBotton, // foreground
          side: BorderSide(color: colorBorder, width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {
          Onpressed();
        },
        child: Text(
          title,
          style: TextStyle(
            color: colorText,
          ),
        ),
      ),
    );
  }
}
