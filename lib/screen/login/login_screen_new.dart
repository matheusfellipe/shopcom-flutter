import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user/user.dart';
import 'package:flutter_application_1/models/user/user_services.dart';
import 'package:flutter_application_1/main_page_screen.dart';
import 'package:flutter_application_1/screen/login/sign_up_screen.dart';

class LoginScreenNew extends StatefulWidget {
  LoginScreenNew({Key? key}) : super(key: key);

  @override
  State<LoginScreenNew> createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  final UserLocal _userLocal = UserLocal();

  final UserServices _userServices = UserServices();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.amber.shade50,
            child: Column(children: [
              const SizedBox(
                height: 60,
              ),
              Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/Ecommerce.png',
                  height: 160,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Lista de Compras",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 156, 61, 27)),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        enabled: true,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Campo deve ser preenchido!!!';
                          }
                          return null;
                        },
                        onSaved: (email) => _userLocal.email = email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                        ),
                        enabled: true,
                        validator: (password) {
                          if (password!.isEmpty) {
                            return 'Campo deve ser preenchido!!!';
                          }
                          return null;
                        },
                        onSaved: (password) => _userLocal.password = password,
                      ),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          bool ok = await _userServices.signIn(_userLocal);
                          if (ok) {
                            if (mounted) {
                              //mounted só funciona em stf
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const MainPageScreen(),
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: const Text('Entrar'),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text('Registrar-se'),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
