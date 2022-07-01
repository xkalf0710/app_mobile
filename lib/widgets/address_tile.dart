import 'package:app_mobile/models/address/index.dart';
import 'package:flutter/material.dart';


class AddressTile extends StatelessWidget {

  final AddressModel item;
  final bool isActive;

  const AddressTile(this.item, {Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(vertical: 10),
      decoration: isActive
      ? BoxDecoration(
        border: Border.all(color: Colors.black87),
      )
          : null,
      child: Row(
        children: [
          Expanded(child: Column(
            children:  const [
              Text("Firstname:"),
              Text("Lastname:"),
              Text("Country:"),
              Text("Street:"),
              Text("City:"),
              Text("State:"),
              Text("Postcode:"),
              Text("Email:"),
            ],
          ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(item.firstname ?? ''),
                Text(item.lastname ?? ''),
                Text(item.country ?? ''),
                Text(item.street ?? ''),
                Text(item.city ?? ''),
                Text(item.state ?? ''),
                Text(item.postcode ?? ''),
                Text(item.email ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
