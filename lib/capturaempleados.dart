import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaEmpleadosScreen extends StatefulWidget {
  const CapturaEmpleadosScreen({Key? key}) : super(key: key);

  @override
  _CapturaEmpleadosScreenState createState() => _CapturaEmpleadosScreenState();
}

class _CapturaEmpleadosScreenState extends State<CapturaEmpleadosScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreCtrl = TextEditingController();
  final _puestoCtrl = TextEditingController();
  final _salarioCtrl = TextEditingController();

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      var nombre = _nombreCtrl.text;
      var puesto = _puestoCtrl.text;
      var salario = double.tryParse(_salarioCtrl.text) ?? 0.0;
      
      // Se utiliza el agente/clase para actualizar el diccionario
      GuardarDatosDiccionario.agregarEmpleado(nombre, puesto, salario);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Empleado guardado con éxito!', style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      
      // Limpiar los campos después de guardar
      _nombreCtrl.clear();
      _puestoCtrl.clear();
      _salarioCtrl.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturar Empleado', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      const Text(
                        'Datos del Empleado',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _nombreCtrl,
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          prefixIcon: const Icon(Icons.person, color: Colors.indigo),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _puestoCtrl,
                        decoration: InputDecoration(
                          labelText: 'Puesto',
                          prefixIcon: const Icon(Icons.work, color: Colors.indigo),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _salarioCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Salario',
                          prefixIcon: const Icon(Icons.attach_money, color: Colors.green),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                        validator: (value) {
                           if (value == null || value.isEmpty) return 'Campo requerido';
                           if (double.tryParse(value) == null) return 'Ingrese un número válido';
                           return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.save, size: 28),
                label: const Text('Guardar Datos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                ),
                onPressed: _guardar,
              )
            ],
          ),
        ),
      ),
    );
  }
}
