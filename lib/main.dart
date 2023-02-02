import 'package:client_control/models/clients/client_list.dart';
import 'package:client_control/provider/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/client_page/clients_page.dart';
import 'package:client_control/pages/client_types_page/client_types_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: createNotifierProvider,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de clientes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ClientsPage(title: 'Clientes'),
        '/tipos': (context) => const ClientTypesPage(title: 'Tipos de cliente'),
      },
    );
  }
}
