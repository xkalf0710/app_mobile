import 'package:app_mobile/blocs/events.dart';
import 'package:app_mobile/blocs/index.dart';
import 'package:app_mobile/global_keys.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MainBloc extends Bloc<MainEvent, MainState>{

  MainBloc() : super(MainInitial());


  static MainBloc get bloc => BlocProvider.of<MainBloc>(GlobalKeys.navigatorKey.currentContext!);


}