import 'claseempleado.dart';
import 'diccionarioempleado.dart';

class GuardarDatosDiccionario {
  static void agregarEmpleado(String nombre, String puesto, double salario) {
    // Generar ID autonumérico basado en el tamaño actual + 1
    int nuevoId = datosEmpleado.length + 1;
    
    Empleado nuevoEmpleado = Empleado(
      id: nuevoId,
      nombre: nombre,
      puesto: puesto,
      salario: salario,
    );

    // Guardar en el diccionario
    datosEmpleado[nuevoId] = nuevoEmpleado;
  }
}