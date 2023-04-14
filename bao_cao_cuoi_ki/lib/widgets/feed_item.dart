import 'package:bao_cao_cuoi_ki/services/utils.dart';
import 'package:bao_cao_cuoi_ki/widgets/heart_btn.dart';
import 'package:bao_cao_cuoi_ki/widgets/price_widget.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  @override
  void initState() {
    quantityTexttingController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    quantityTexttingController.dispose();
    super.dispose();
  }

  final quantityTexttingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final theme = utils.getTheme;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(
          (12),
        ),
        child: Column(
          children: [
            Image.network(
              'https://product.hstatic.net/1000306633/product/hades_20.03.23.7268_7384778b28e042c88c43c6533d53b353.jpg',
              height: size.width * 0.22,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'title',
                    color: color,
                    textSize: 20,
                    isTitle: true,
                  ),
                  HearButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: PriceWidget(
                      price: 150,
                      isOnSale: true,
                      salesPrice: 236,
                      textPrice: quantityTexttingController.text,
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: FittedBox(
                            child: TextWidget(
                              text: 'SL',
                              color: color,
                              textSize: 20,
                              isTitle: true,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          flex: 2,
                          // TextField can be used also instead of the textFormField
                          child: TextFormField(
                            controller: quantityTexttingController,
                            key: const ValueKey('value'),
                            style: TextStyle(color: color, fontSize: 18),
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            enabled: true,
                            onChanged: (valueee) {
                              setState(() {});
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9.]'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).cardColor),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0)))),
                ),
                child: TextWidget(
                  text: 'mua hàng',
                  color: color,
                  isTitle: true,
                  maxLines: 1,
                  textSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
