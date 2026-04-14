import 'package:flutter/material.dart';
import 'diccionarioempleado.dart';

class VerEmpleadosScreen extends StatelessWidget {
  const VerEmpleadosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convertir los valores del diccionario a una lista
    var empleados = datosempleado.values.toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros de Empleados', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade100,
      body: empleados.isEmpty 
          ? const Center(
              child: Text(
                'No hay empleados registrados aún.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: empleados.length,
              itemBuilder: (context, index) {
                var emp = empleados[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.teal.shade100,
                      child: Text(
                        '${emp.id}', 
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 18)
                      ),
                    ),
                    title: Text(
                      emp.nombre,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Puesto: ${emp.puesto}\nSalario: \$${emp.salario.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 15, color: Colors.grey.shade700, height: 1.4),
                      ),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
