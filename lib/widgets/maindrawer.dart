import 'package:app_mobile/auth/LoginPage.dart';
import 'package:app_mobile/providers/providers.dart';
import 'package:app_mobile/screens/addressListPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child){
        final user = provider.user;
        return Drawer(
          elevation: 20.0,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  arrowColor: Colors.white54,
                  accountName: Text(''),
                  accountEmail: Text(''),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white54,
                ),
              ),
              ListTile(
                title: const Text("Нүүр"),
                leading: IconButton(
                  icon: const Icon(Icons.location_on_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              const Divider(color: Colors.white),
              ListTile(
                title: const Text("Хаяг"),
                leading: IconButton(
                  icon: const Icon(Icons.local_library_rounded),
                  onPressed: () {},
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AddressListPage()));
                },
              ),
              const Divider(color: Colors.white),
              ListTile(
                title: const Text("Бүтээгдэхүүн"),
                leading: IconButton(
                  icon: const Icon(Icons.local_library_rounded),
                  onPressed: () {},
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              const Divider(color: Colors.grey),
              ListTile(
                title: const Text("Гарах"),
                leading: IconButton(
                  icon: const Icon(Icons.exit_to_app_outlined),
                  onPressed: () {},
                ),
                onTap: () {
                  provider.resetUser();
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
              ),
              const Divider(color: Colors.grey),
            ],
          ),
        );
      },
    );
  }
}

