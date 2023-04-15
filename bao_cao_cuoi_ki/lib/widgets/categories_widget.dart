import 'package:bao_cao_cuoi_ki/provider/dart_theme_provider.dart';
import 'package:bao_cao_cuoi_ki/screens/product_screen.dart';
import 'package:bao_cao_cuoi_ki/services/global_methods.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesWiget extends StatelessWidget {

  const CategoriesWiget({
    super.key,
    required this.catText,
    required this.imgPath,
    required this.passedColor,
  });
  final String catText, imgPath;
  final Color passedColor;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        if (catText == 'Áo Khoác') {
          GlobalMethods.navigateTo(
              ctx: context, routeName: ProductsScreen.routeName);
        }
      },
      child: Container(
        // height: screenWidth * 0.6,
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: passedColor.withOpacity(0.7), width: 2),
        ),
        child: Column(children: [
          Container(
            height: screenWidth * 0.3,
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imgPath,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          TextWidget(
            text: catText,
            color: color,
            textSize: 20,
          )
        ]),
      ),
    );
  }
}
