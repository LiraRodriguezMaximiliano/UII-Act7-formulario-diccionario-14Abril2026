import 'package:flutter/material.dart';
import 'inicio.dart';
import 'capturaempleados.dart';
import 'verempleados.dart';

void main() {
  runApp(FerreteriaApp());
}

class FerreteriaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ferreteria el Patito',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // Definición de rutas nombradas
      initialRoute: '/',
      routes: {
        '/': (context) => Inicio(),
        '/captura': (context) => CapturaEmpleados(),
        '/ver': (context) => VerEmpleados(),
      },
    );
  }
}