import 'package:cuesoft_test1/bloc/auth%20bloc/app_bloc.dart';
import 'package:cuesoft_test1/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/custom_text.dart';
import '../widget/custom_textform.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: "Login"),
        ),
        body: Center(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: namecontroller,
                  ),
                  CustomTextField(controller: passwordcontroller),
                  TextButton(
                    onPressed: () {
                      context.read<Cuesoft>().add(LoginEvent());
                      BlocListener<Cuesoft, CuesoftState>(
                          listener: (context, state) {
                        if (state is AuthenticatedState) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Welcome()));
                        }
                      });
                    },
                    child: Text("Login"),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
