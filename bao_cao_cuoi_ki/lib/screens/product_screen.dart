import 'package:bao_cao_cuoi_ki/models/products_model.dart';
import 'package:bao_cao_cuoi_ki/provider/product_provider.dart';
import 'package:bao_cao_cuoi_ki/screens/btm_bar.dart';
import 'package:bao_cao_cuoi_ki/screens/categories.dart';
import 'package:bao_cao_cuoi_ki/services/global_methods.dart';
import 'package:bao_cao_cuoi_ki/services/utils.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = "/ProductsScreenState";
  ProductsScreen({
    super.key,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> aoList = [];

  @override
  Widget build(BuildContext context) {
    ProductsProvider provider = Provider.of<ProductsProvider>(context);
    provider.getProductList();
    aoList = provider.throwProductModelList;
    final utils = Utils(context);
    Color color = utils.color;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product All'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            GlobalMethods.navigateTo(
                ctx: context, routeName: BottomBarScreen.routeName);
          },
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 250,
        mainAxisSpacing: 30, // khoang cach chieu rong
        crossAxisSpacing: 20, // khoang cach chieu cao
        children: aoList
            .map((e) => Products(
                  image: e.image,
                  name: e.name,
                  price: e.price,
                ))
            .toList(),
      ),
    );
  }

  Widget Products({
    required String image,
    required String name,
    required int price,
  }) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(left: 8),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image)),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ]);
  }
}
