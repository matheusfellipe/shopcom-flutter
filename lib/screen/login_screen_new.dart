import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../common/text_form_item.dart';

class LoginScreenNew extends StatelessWidget {
  const LoginScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.teal.shade300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: Image.asset(
                'assets/Ecommerce.png',
                matchTextDirection: true,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Lista de Aplicações",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              color: Colors.teal.shade300,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    textFormItem(context, 'E-mail', false),
                    const SizedBox(
                      height: 15,
                    ),
                    textFormItem(context, 'Senha', true),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Entrar")),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Registrar-se")),
              ),
            ]),
          ],
        ),
      ),
    ));
  }
}
