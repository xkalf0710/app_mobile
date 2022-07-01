import 'package:app_mobile/screens/addAddressPage.dart';
import 'package:app_mobile/widgets/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child){
        return Scaffold(
          appBar: AppBar(title: const Text('Хаягийн жагсаалт'),
          centerTitle: true,),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => AddAddressPage())),
            
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
            child: provider.addresses.isNotEmpty
            ? Scrollbar(child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ListView.builder(itemBuilder: ((context, index) => AddressTile(provider.addresses[index]))),
            ))
                : const Center(child: Text('Хоосон байна'),),
          ),
        );
      },
    );
  }
}
