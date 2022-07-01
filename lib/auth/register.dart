import 'package:app_mobile/utils/regex.dart';
import 'package:app_mobile/widgets/button.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  final _lastnameCtrl = TextEditingController();
  final _firstnameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();


  void _onPress(){
    if(_formKey.currentState!.validate()){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Бүртгүүлэх'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/picture.jpg',
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _lastnameCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Овог',
                            prefixIcon: Icon(Icons.face)),
                        validator: UtilRegex.validate,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _firstnameCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Нэр',
                            prefixIcon: Icon(Icons.person)),
                        validator: UtilRegex.validate,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _phoneCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Утасны дугаар',
                            prefixIcon: Icon(Icons.phone)),
                        validator: UtilRegex.validate,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _emailCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Цахим шуудан',
                            prefixIcon: Icon(Icons.email_outlined)),
                        validator: UtilRegex.emailValidate,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordCtrl,
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Нууц үг',
                            prefixIcon: Icon(Icons.password_outlined)),
                        validator: UtilRegex.validate,
                      ),
                      const SizedBox(height: 20),
                      Button(onPress: _onPress, title: 'Бүртгүүлэх'),
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
