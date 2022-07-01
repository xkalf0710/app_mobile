import 'package:app_mobile/blocs/bloc.dart';
import 'package:app_mobile/blocs/events.dart';
import 'package:app_mobile/blocs/states.dart';
import 'package:app_mobile/providers/providers.dart';
import 'package:app_mobile/screens/addorderpage.dart';
import 'package:app_mobile/widgets/page_loader.dart';
import 'package:app_mobile/widgets/productcard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../widgets/button.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  final _bloc = MainBloc();
  bool loading = false;

  @override
  void initState(){
    super.initState();
    _bloc.add(GetCart());
  }

  _saveCart(){
    _bloc.add(UpdateCart());
  }
  _createOrder(){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> AddOrderPage()));
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: [
      BlocListener<MainBloc, MainState>(
          bloc: _bloc,
          listener: (context, state) async{

          }),
    ], child: BlocBuilder<MainBloc, MainState>(
      bloc: _bloc,
      builder: (context, state){
        return Consumer<MainProvider>(builder: (context, provider, child){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Сагс'),
              centerTitle: true,
            ),
            persistentFooterButtons: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Button(title: 'Хадгалах', onPress: _saveCart),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Button(title: 'Захиалах', onPress: _createOrder),
                  ),
                ],
              )
            ],
            body: !loading
                ? (provider.cart.products ?? []).isNotEmpty
                ? Scrollbar(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: provider.cart.products!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (BuildContext context, int index) => ProductCardCard(
                    item: provider.getProductById(provider.cart.products![index].product ?? ''),
                    quantity: provider.cart.products![index].quantity ?? 0,
                  ),
                ),
              ),
            )
                : const Center(
              child: Text('Хоосон байна'),
            )
                : const PageLoader(),
          );
        });
      },
    ));
  }
}
