import 'package:client_control/models/client_types/client_type.dart';
import 'package:client_control/models/clients/client_list.dart';
import 'package:flutter/material.dart';

List<ClientType> types = [
  ClientType(name: 'Platinum', icon: Icons.credit_card),
  ClientType(name: 'Golden', icon: Icons.card_membership),
  ClientType(name: 'Titanium', icon: Icons.credit_score),
  ClientType(name: 'Diamond', icon: Icons.diamond),
];

ClientList createNotifierProvider(BuildContext context) {
  return ClientList([]);
}
