import 'package:app_mobile/screens/Cart.dart';
import 'package:app_mobile/screens/Home.dart';
import 'package:app_mobile/screens/SearchPage.dart';
import 'package:app_mobile/screens/notifictions.dart';
import 'package:app_mobile/widgets/maindrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int index = 1;

  @override
  void initState(){
    super.initState();
  }
  void _setIndex(int value){
    HapticFeedback.mediumImpact();
    setState((){
      index = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/picture.jpg', width: 150.0,height: 150.0,),
        leading: IconButton(
          onPressed: ()=> _key.currentState!.openDrawer(),
          icon: const Icon(Icons.menu, color: Colors.black87,),

        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: SearchPage()),
            icon: const Icon(Icons.search, color: Colors.black87),
          ),
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Notifications())),
            icon: const Icon(Icons.notifications_active, color: Colors.black87),
          ),
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Cart())),
            icon: const Icon(Icons.shopping_cart, color: Colors.black87),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: IndexedStack(
          index: index,
          children:  const[
             Home(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Нүүр',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Бүтээгдэхүүн',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Миний',
          ),
        ],
        currentIndex: index,
        onTap: _setIndex,
        selectedLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor.withOpacity(0.4),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}


