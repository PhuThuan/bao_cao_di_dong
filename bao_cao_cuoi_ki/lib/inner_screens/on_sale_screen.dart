import 'package:bao_cao_cuoi_ki/services/utils.dart';
import 'package:bao_cao_cuoi_ki/widgets/on_sale_widget.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final productProviders = Provider.of<ProductsProvider>(context);
    // List<ProductModel> productsOnSale = productProviders.getOnSaleProducts;
    bool isEmpty = false;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Products on sale',
          color: color,
          textSize: 24.0,
          isTitle: true,
        ),
      ),
      body: isEmpty
          ? Center(
              child: Text(
                'No products on sale yet!,\nStay tuned',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color, fontSize: 30, fontWeight: FontWeight.w700),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(16, ((index) {
                return OnSaleWidget();
              })),
              //  List.generate(productsOnSale.length, (index) {
              //   return ChangeNotifierProvider.value(
              //     value: productsOnSale[index],
              //     child: const OnSaleWidget(),
              //   );
              // }),
            ),
    );
  }
}
