import 'package:app_mobile/models/product/index.dart';
import 'package:app_mobile/providers/providers.dart';
import 'package:app_mobile/screens/Cart.dart';
import 'package:flutter/material.dart';


class ProductDetailPage extends StatelessWidget {
  ProductModel item;

  ProductDetailPage( this.item, {Key? key,}) : super(key: key);
  _onPress(context){
    MainProvider.provider.addCart(item.id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бүтээгдэхүүн'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Cart())),
              icon: const Icon(Icons.shopping_cart)),

        ],
      ),

      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _onPress(context),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
            ),
            child: const Text(
              'Сагсанд нэмэх',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
        ),
      ],
       body: SingleChildScrollView(
         padding: const EdgeInsets.all(20),

         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,

           children: [
             Hero(tag: item.id, child: Image.network(item.primaryImage,
             fit: BoxFit.fill,),
             ),

             const SizedBox(height: 10,),
             Text(
               item.title ?? '',
               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),

             ),
             const SizedBox(height: 12,),
             Text(
               item.priceUSD.toString(),
               style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
             ),
             const SizedBox(height: 12),
             const Text(
               "Тайлбар",
               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
             ),
             ...List.generate(
               (item.description ?? []).length,
                   (idx) => Text(
                 item.description![idx],
                 style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
               ),
             ),
             const SizedBox(height: 10),
             Text(
               item.features ?? '',
               style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
             ),
           ],
         ),

       ),
    );
  }
}
