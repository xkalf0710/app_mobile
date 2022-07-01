import 'package:app_mobile/models/product/index.dart';
import 'package:app_mobile/widgets/productCard.dart';
import 'package:flutter/material.dart';


class ProductList extends StatelessWidget {
  
  final List<ProductModel> data;
  
  const ProductList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: GridView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.7,),

        itemBuilder: (BuildContext context, int index) => ProductCard(data[index], item,),
      ),

    ));
  }
}
