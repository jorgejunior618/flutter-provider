import 'package:client_control/models/client.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({
    Key? key,
    required this.client,
    required this.onDismissed,
  }) : super(key: key);

  final Client client;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: Material(
          type: MaterialType.card,
          elevation: 2.0,
          color: const Color(0xFFf3e5ab),
          child: ListTile(
            leading: Icon(client.type.icon),
            onTap: () {},
            splashColor: Colors.amber[200],
            title: Text(client.name + ' (' + client.type.name + ')'),
            iconColor: Colors.indigo,
          ),
        ),
      ),
      onDismissed: onDismissed,
    );
  }
}
