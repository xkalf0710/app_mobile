import 'package:app_mobile/auth/SplashPage.dart';
import 'package:app_mobile/blocs/bloc.dart';
import 'package:app_mobile/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MainProvider()),
      BlocProvider<MainBloc>(create: (_) => MainBloc()),
    ],

    child:  MaterialApp(
      title: 'Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    ),);
  }
}


