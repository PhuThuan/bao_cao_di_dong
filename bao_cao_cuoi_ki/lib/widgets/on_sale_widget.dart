import 'package:bao_cao_cuoi_ki/services/utils.dart';
import 'package:bao_cao_cuoi_ki/widgets/heart_btn.dart';
import 'package:bao_cao_cuoi_ki/widgets/price_widget.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final theme = utils.getTheme;
    Size size = utils.getScreenSize;

    final Color color = utils.color;
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://product.hstatic.net/1000306633/product/hades_20.03.23.7268_7384778b28e042c88c43c6533d53b353.jpg',
                    height: size.width * 0.22,
                    fit: BoxFit.fill,
                  ),
                  // FancyShimmerImage(imageUrl: 'https://product.hstatic.net/1000306633/product/hades_20.03.23.7268_7384778b28e042c88c43c6533d53b353.jpg',  height: size.width * 0.22,  width: size.width * 0.22, fit: BoxFit.fill,),
                  Column(
                    children: [
                      TextWidget(
                        text: 'SL 10',
                        color: color,
                        textSize: 22,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              size: 22,
                              color: color,
                            ),
                          ),
                          HearButton(),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              PriceWidget(
                price: 150,
                isOnSale: true,
                salesPrice: 236,
                textPrice: '1',
              ),
              const SizedBox(height: 5),
              TextWidget(
                text: 'productModel.title,',
                color: color,
                textSize: 16,
                isTitle: true,
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
