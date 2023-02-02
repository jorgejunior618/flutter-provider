import 'package:client_control/models/client_types/client_type.dart';
import 'package:client_control/models/clients/client.dart';
import 'package:client_control/models/clients/client_list.dart';
import 'package:flutter/material.dart';

List<ClientType> types = [
  ClientType(name: 'Platinum', icon: Icons.credit_card),
  ClientType(name: 'Golden', icon: Icons.card_membership),
  ClientType(name: 'Titanium', icon: Icons.credit_score),
  ClientType(name: 'Diamond', icon: Icons.diamond),
];

ClientList createNotifierProvider(BuildContext context) {
  return ClientList(clients: [
    // Client(name: 'Geraldo', email: 'leo@email.com', type: types[0]),
    // Client(name: 'Paulo', email: 'leo@email.com', type: types[1]),
    Client(name: 'Caio', email: 'leo@email.com', type: types[2]),
    // Client(name: 'Ruan', email: 'ruan@email.com', type: types[3]),
  ]);
}
