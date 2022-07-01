import 'package:app_mobile/auth/forgotPassword.dart';
import 'package:app_mobile/auth/register.dart';
import 'package:app_mobile/screens/Home.dart';
import 'package:app_mobile/screens/MainPage.dart';
import 'package:app_mobile/utils/regex.dart';
import 'package:app_mobile/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'hello@example.com');
  final _passwordController = TextEditingController(text: '123');

  void _onLoginPress(){
    if(_formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MainPage()));
    }
  }

  void _onForgotPress(){
   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ForgotPassword()));
  }
  void _onRegister(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Register()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Image.asset("assets/picture.jpg", width: MediaQuery.of(context).size.width * 0.8,
                ),
                const SizedBox(height: 50,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(labelText: 'Имэйл хаяг'),
                        validator: UtilRegex.emailValidate,
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(labelText: "Нууц үг"),
                        validator: UtilRegex.validate,
                      ),
                      const SizedBox(height: 20,),
                      Button(onPress: _onLoginPress, title: 'Нэвтрэх'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: _onForgotPress, child: const Text(
                      'Нууц үгээ мартсан уу?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    const Text('Шинэ хэрэглэгч'),
                    TextButton(onPressed: _onRegister, child: const Text('Бүртгүүлэх', style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
