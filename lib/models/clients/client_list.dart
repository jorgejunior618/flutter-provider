import 'package:client_control/models/clients/client.dart';
import 'package:flutter/material.dart';

class ClientList extends ChangeNotifier {
  ClientList(
    this._clients,
  );

  final List<Client> _clients;

  List<Client> get clients {
    return _clients;
  }

  void addClient(Client client) {
    _clients.add(client);
  }

  void removeClient(int index) {
    _clients.removeAt(index);
  }
}
