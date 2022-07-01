import 'package:app_mobile/blocs/bloc.dart';
import 'package:app_mobile/blocs/events.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сагс'),
        centerTitle: true,
      ),
    );
  }
}
