import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

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
            textFormItem(context, 'E-mail', false),
            const SizedBox(
              height: 15,
            ),
            textFormItem(context, 'Senha', false),
            const SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(onPressed: () {}, child: const Text("Entrar")),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Registrar-se")),
            ]),
          ],
        ),
      ),
    ));
  }

  Widget textFormItem(BuildContext context, String name, bool obscure) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .85,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: name,
            labelStyle: const TextStyle(
              fontSize: 12,
              color: Colors.green,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.teal))),
      ),
    );
  }
}
