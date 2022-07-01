import 'package:app_mobile/blocs/bloc.dart';
import 'package:app_mobile/blocs/events.dart';
import 'package:app_mobile/models/address/index.dart';
import 'package:app_mobile/providers/providers.dart';
import 'package:app_mobile/utils/regex.dart';
import 'package:app_mobile/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/states.dart';


class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _bloc = MainBloc();
  final _formKey = GlobalKey<FormState>();
  final _firstnameCtrl = TextEditingController();
  final _lastnameCtrl = TextEditingController();
  final _countryCtrl = TextEditingController();
  final _streetCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _stateCtrl = TextEditingController();
  final _postcodeCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  _onPress() {
    if (_formKey.currentState!.validate()) {
      var data = AddressModel();
      data.firstname = _firstnameCtrl.text;
      data.lastname = _lastnameCtrl.text;
      data.country = _countryCtrl.text;
      data.street = _streetCtrl.text;
      data.city = _cityCtrl.text;
      data.state = _stateCtrl.text;
      data.postcode = _postcodeCtrl.text;
      data.email = _emailCtrl.text;
      data.user = MainProvider.provider.user?.id;
      _bloc.add(AddAddress(data));
    }
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
        return Scaffold(
          appBar: AppBar(title: const Text('Хаяг нэмэх'), centerTitle: true),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _firstnameCtrl,
                            decoration: const InputDecoration(labelText: 'Firstname'),
                            validator: UtilRegex.validate,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _lastnameCtrl,
                            decoration: const InputDecoration(labelText: 'Lastname'),
                            validator: UtilRegex.validate,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _countryCtrl,
                            decoration: const InputDecoration(labelText: 'Country'),
                            validator: UtilRegex.validate,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _streetCtrl,
                            decoration: const InputDecoration(labelText: 'Street'),
                            validator: UtilRegex.validate,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _cityCtrl,
                            decoration: const InputDecoration(labelText: 'City'),
                            validator: UtilRegex.validate,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _stateCtrl,
                            decoration: const InputDecoration(labelText: 'State'),
                            validator: UtilRegex.validate,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _postcodeCtrl,
                            decoration: const InputDecoration(labelText: 'Postcode'),
                            validator: UtilRegex.validate,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _emailCtrl,
                            decoration: const InputDecoration(labelText: 'Email'),
                            validator: UtilRegex.validate,
                          ),
                          const SizedBox(height: 20),
                          Button(onPress: _onPress, title: 'Нэмэх'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
