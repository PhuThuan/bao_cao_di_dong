import 'package:bao_cao_cuoi_ki/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> productModelList = [];
  late ProductModel productModel;
  Future<void> getProductList() async {
    List<ProductModel> newProductModelList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('product').get();
    querySnapshot.docs.forEach((element) {
      productModel = ProductModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newProductModelList.add(productModel);
    });
    //  print(productModel.name);
    productModelList = newProductModelList;
    notifyListeners();
  }

  get throwProductModelList {
    return productModelList;
  }
}
