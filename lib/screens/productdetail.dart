import 'package:app_mobile/models/product/index.dart';
import 'package:app_mobile/providers/providers.dart';
import 'package:app_mobile/screens/Cart.dart';
import 'package:flutter/material.dart';


class ProductDetailPage extends StatelessWidget {
  ProductModel item;

  ProductDetailPage({Key? key, required this.item}) : super(key: key);



  _onPress(context){
    MainProvider.provider.addCart(item.id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
