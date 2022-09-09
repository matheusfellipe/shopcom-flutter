import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 30, left: 25, right: 25),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/Ecommerce.png',
                  height: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Lista de Aplicações",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Entrar")),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Text("Registrar-se")),
                        ]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
