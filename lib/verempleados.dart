import 'package:flutter/material.dart';
import 'diccionarioempleado.dart';

class VerEmpleados extends StatelessWidget {
  const VerEmpleados({super.key}); // Constructor con key para quitar advertencia azul

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text("Lista de Empleados"),
        backgroundColor: Colors.orange[800],
      ),
      body: datosEmpleado.isEmpty 
        ? const Center(
            child: Text("No hay empleados registrados", 
            style: TextStyle(color: Colors.white)))
        : ListView.builder(
            itemCount: datosEmpleado.length,
            itemBuilder: (context, index) {
              int key = datosEmpleado.keys.elementAt(index);
              var emp = datosEmpleado[key]!;
              return Card(
                color: const Color(0xFFE0E0E0),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange[800], 
                    child: Text("${emp.id}", style: const TextStyle(color: Colors.white))
                  ),
                  title: Text(emp.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Puesto: ${emp.puesto}"),
                  trailing: Text("\$${emp.salario}", 
                    style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
    );
  }
}