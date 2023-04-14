import 'package:bao_cao_cuoi_ki/services/utils.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget({
    super.key,
    required this.salesPrice,
    required this.isOnSale,
    required this.price,
    required this.textPrice,
  });
  final double salesPrice, price;
  final String textPrice;
  final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Color color = utils.color;
    double userPrice = isOnSale ? salesPrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text:
                '\Vnd ${(userPrice * int.parse(textPrice)).toStringAsFixed(0)}',
            color: Colors.green,
            textSize: 18,
          ),
          SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              '\Vnd ${(userPrice * int.parse(textPrice)).toStringAsFixed(0)}',
              style: TextStyle(
                  fontSize: 15,
                  color: color,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }
}
