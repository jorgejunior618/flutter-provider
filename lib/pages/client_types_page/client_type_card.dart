import 'package:client_control/models/client_types/client_type.dart';
import 'package:flutter/material.dart';

class ClientTypeCard extends StatelessWidget {
  const ClientTypeCard({
    Key? key,
    required this.type,
    required this.onDismissed,
  }) : super(key: key);

  final ClientType type;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      child: ListTile(
        leading: Icon(type.icon),
        title: Text(type.name),
        iconColor: Colors.deepOrange,
      ),
      onDismissed: onDismissed,
    );
  }
}
