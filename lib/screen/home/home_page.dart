import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: TextField(
              style: const TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(255, 183, 181, 179),
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                suffixIcon: const Icon(Icons.search_sharp),
                hintText: "Buscar...",
                fillColor: Colors.grey.shade300,
                filled: true,
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 32.0),
                    borderRadius: BorderRadius.circular(5.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white, width: 32.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          // ElevatedButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.email),
          //   label: const Text("Contact me"),
          //   style: ElevatedButton.styleFrom(
          //     textStyle: const TextStyle(fontSize: 15),
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 5, bottom: 18.0),
            child: Text(
              'Compras realizadas',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            color: Colors.black12,
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                        title: Text('Compra $index'),
                        subtitle: const Text('Descrição da compra realizada')),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5, top: 18, bottom: 18.0),
            child: Text(
              'DashBoard',
              style: TextStyle(fontSize: 18),
            ),
          ),

          Container(
            color: Colors.black12,
            height: 100,
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                  title: Text('Comparativo de preços'),
                  subtitle: Text('Este card é para apresentar dados'),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5, top: 18, bottom: 18.0),
            child: Text(
              'Listagem horizontal',
              style: TextStyle(fontSize: 18),
            ),
          ),

          Container(
            color: Colors.black12,
            height: 100.0,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(
                  child: Text('Exemplo $index'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
