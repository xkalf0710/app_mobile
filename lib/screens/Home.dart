import 'package:app_mobile/blocs/bloc.dart';
import 'package:app_mobile/blocs/events.dart';
import 'package:app_mobile/providers/providers.dart';
import 'package:app_mobile/widgets/page_loader.dart';
import 'package:app_mobile/widgets/productlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _bloc = MainBloc();

  @override
  void initState(){
    super.initState();

    _bloc.add(GetProductList());

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child){
        return provider.products.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 20, right: 20, left: 20), child: Text(
              'Онцлох бүтээгдэхүүн',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),),
            const SizedBox(height: 10,),
            Expanded(child: ProductList(provider.products,)),
          ],
        )
            : const PageLoader();
      },
    );
  }
}
