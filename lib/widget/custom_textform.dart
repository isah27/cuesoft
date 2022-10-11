import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.controller, super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width - 20,
      child: TextFormField(
        controller: controller,
        onSaved: (newValue) {
          controller.text = newValue!;
        },
        decoration: InputDecoration(
          
        ),
      ),
    );
  }
}
