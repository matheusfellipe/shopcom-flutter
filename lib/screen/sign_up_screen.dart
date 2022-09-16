import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/text_form_item.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            textFormItem(context, "Nome", false),
            textFormItem(context, "Email", false),
            textFormItem(context, "Senha", false),
            textFormItem(context, "Rede Social", false),
          ],
        ),
      ),
    );
  }
}
