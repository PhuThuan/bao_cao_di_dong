import 'package:bao_cao_cuoi_ki/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class HearButton extends StatelessWidget {
  const HearButton({super.key});

  @override
  Widget build(BuildContext context) {
        final Utils utils = Utils(context);
   
    Color color = utils.color;
    return GestureDetector(
      onTap: () {
        print('hien thi botton pressed');
      },
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
