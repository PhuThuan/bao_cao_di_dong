import 'package:bao_cao_cuoi_ki/services/utils.dart';
import 'package:bao_cao_cuoi_ki/widgets/categories_wiget.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
    super.key,
  });
  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/categories/aokhoac1.jpg',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/categories/quandai1.jpg',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/categories/quanngan1.jpg',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/categories/phukien1.jpg',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/categories/aotaydai1.jpg',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/categories/aotayngan1.jpg',
      'catText': 'Fruits',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Categories',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 250,
        mainAxisSpacing: 30, // khoang cach chieu rong
        crossAxisSpacing: 20, // khoang cach chieu cao 
        children: List.generate(6, (index) {
          return CategoriesWiget(
            catText: catInfo[index]['catText'],
            imgPath: catInfo[index]['imgPath'],
            passedColor: gridColors[index],
          );
        }),
      ),
    );
  }
}
