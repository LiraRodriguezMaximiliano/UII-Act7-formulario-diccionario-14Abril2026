import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaEmpleados extends StatefulWidget {
  @override
  _CapturaEmpleadosState createState() => _CapturaEmpleadosState();
}

class _CapturaEmpleadosState extends State<CapturaEmpleados> {
  final _nombreCtrl = TextEditingController();
  final _puestoCtrl = TextEditingController();
  final _salarioCtrl = TextEditingController();

  void _guardar() {
    if (_nombreCtrl.text.isNotEmpty && _puestoCtrl.text.isNotEmpty && _salarioCtrl.text.isNotEmpty) {
      GuardarDatosDiccionario.agregarEmpleado(
        _nombreCtrl.text,
        _puestoCtrl.text,
        double.parse(_salarioCtrl.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Empleado guardado con éxito")));
      Navigator.pop(context); // Regresar al inicio
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      appBar: AppBar(title: Text("Registro de Empleado"), backgroundColor: Colors.orange[800]),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Text("DATOS DEL EMPLEADO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 20),
                TextField(controller: _nombreCtrl, decoration: InputDecoration(labelText: "Nombre Completo", border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextField(controller: _puestoCtrl, decoration: InputDecoration(labelText: "Puesto", border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextField(controller: _salarioCtrl, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "Salario Mensual", border: OutlineInputBorder())),
                SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[800], minimumSize: Size(double.infinity, 50)),
                  onPressed: _guardar,
                  child: Text("GUARDAR EN DICCIONARIO", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}