import 'package:client_control/models/client_type.dart';
import 'package:client_control/models/client.dart';
import 'package:client_control/pages/client_page/client_card.dart';
import 'package:flutter/material.dart';

import '../../components/hamburger_menu.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

List<ClientType> types = [
  ClientType(name: 'Platinum', icon: Icons.credit_card),
  ClientType(name: 'Golden', icon: Icons.card_membership),
  ClientType(name: 'Titanium', icon: Icons.credit_score),
  ClientType(name: 'Diamond', icon: Icons.diamond),
];

List<Client> clients = [
  Client(name: 'Geraldo', email: 'leo@email.com', type: types[0]),
  Client(name: 'Paulo', email: 'leo@email.com', type: types[1]),
  Client(name: 'Caio', email: 'leo@email.com', type: types[2]),
  Client(name: 'Ruan', email: 'ruan@email.com', type: types[3]),
];

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const HamburgerMenu(),
      body: ListView.builder(
        itemCount: clients.length,
        padding: const EdgeInsets.only(top: 4.0),
        itemBuilder: (context, index) {
          return ClientCard(
            client: clients[index],
            onDismissed: (direction) {
              setState(() {
                clients.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          createType(context);
        },
        tooltip: 'Add Tipo',
        child: const Icon(Icons.add),
      ),
    );
  }

  void createType(context) {
    TextEditingController nomeInput = TextEditingController();
    TextEditingController emailInput = TextEditingController();
    ClientType dropdownValue = types[0];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Cadastrar cliente'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: nomeInput,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        icon: Icon(Icons.account_box),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextFormField(
                      controller: emailInput,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return DropdownButton(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.indigo,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue as ClientType;
                          });
                        },
                        items: types.map((ClientType type) {
                          return DropdownMenuItem<ClientType>(
                            value: type,
                            child: Text(type.name),
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  child: const Text("Salvar"),
                  onPressed: () async {
                    setState(() {
                      clients.add(Client(
                          name: nomeInput.text,
                          email: emailInput.text,
                          type: dropdownValue));
                    });
                    Navigator.pop(context);
                  }),
              TextButton(
                  child: const Text("Calcelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }
}
