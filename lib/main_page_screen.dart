// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/contacts/contacts_page.dart';
import 'package:flutter_application_1/screen/home/home_page.dart';

import 'package:flutter_application_1/screen/products/product_list_page.dart';
import 'package:flutter_application_1/util/responsive.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  //criando uma lista de widgets vazia
  final List<Widget> _pages = [];
  int _currentIndex = 2;
  late String _title;
  @override
  void initState() {
    super.initState();
    _title = "ListCom - App de Compras";
    _pages.add(const HomePage()); //índice 0
    _pages.add(const ContactsPage()); //índice 1
    _pages.add(const ProductListPage()); //índice 2
  }

  GlobalKey<ScaffoldState> _key = GlobalKey(); // add this
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          leading: IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            _title,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(
                Icons.favorite,
              ),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Buscar',
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
            PopupMenuButton<Text>(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text('Primeiro'),
                  ),
                  const PopupMenuItem(
                    child: Text('Segundo'),
                  ),
                  const PopupMenuItem(
                    child: Text('Terceiro'),
                  ),
                ];
              },
            )
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: onTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_max_rounded,
                ),
                label: "Início",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Perfil de Usuário",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.miscellaneous_services),
              label: "Crud",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: "Crud com Imagem",
            ),
          ],
        ),
        drawer: Responsive.isMobile(context)
            ? Drawer(
                elevation: 2.0,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const DrawerHeader(
                      child: Text(
                        "ListCom - Apps",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            leading: const Icon(Icons.category),
                            title: const Text('Categorias'),
                            onTap: () {
                              debugPrint("teste");
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.multiline_chart),
                            title: const Text('Perfil do Usuário'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : null,
      ),
    );
  }

  //método/função para atualizar o índice do Widget BottomNavigationBar
  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Lista de Compras - APP';
          }
          break;
        case 1:
          {
            _title = 'Exemplo de Listview';
          }
          break;
        case 2:
          {
            _title = 'Listagem de Compras';
          }
          break;
        case 3:
          {
            _title = 'Crud com Imagem';
          }
          break;
      }
    });
  }

  Widget? createAppBar() {
    return AppBar(
      leading: IconButton(
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Text(
        _title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          tooltip: 'Favorite',
          icon: const Icon(
            Icons.favorite,
          ),
          onPressed: () {},
        ),
        IconButton(
          tooltip: 'Buscar',
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {},
        ),
        PopupMenuButton<Text>(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Primeiro'),
              ),
              const PopupMenuItem(
                child: Text('Segundo'),
              ),
              const PopupMenuItem(
                child: Text('Terceiro'),
              ),
            ];
          },
        )
      ],
    );
  }
}
