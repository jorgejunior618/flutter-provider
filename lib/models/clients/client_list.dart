import 'package:client_control/models/clients/client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientList extends ChangeNotifier {
  ClientList({
    required this.clients,
  });

  List<Client> clients;
}
