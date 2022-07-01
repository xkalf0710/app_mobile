import 'package:app_mobile/providers/providers.dart';
import 'package:app_mobile/widgets/productlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: () => query = '', icon: const Icon(Icons.close)),
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () => Navigator.pop(context),

        icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child){
        return ProductList(provider.searchProduct(query));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Та хүссэн бүтээгдэхүүнээ хайна уу'),
    );
  }

}
