import 'package:app_mobile/utils/regex.dart';
import 'package:app_mobile/widgets/button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _onPress(){
    if(_formKey.currentState!.validate()){
      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Нууц үгээ сэргээх'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/picture.jpg',
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                const SizedBox(height: 50),
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
                      const SizedBox(height: 20),
                      Button(onPress: _onPress, title: 'Үргэлжлүүлэх'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
