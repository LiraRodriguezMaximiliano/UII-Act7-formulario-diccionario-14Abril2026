import 'claseempleado.dart';
import 'diccionarioempleado.dart';

class GuardarDatosDiccionario {
  // Nivel principiante: Un método estático para agregar los datos al diccionario
  static void agregarEmpleado(String nombre, String puesto, double salario) {
    int id = nextId; // Asignar el ID autonumérico actual
    Empleado nuevoEmpleado = Empleado(
      id: id,
      nombre: nombre,
      puesto: puesto,
      salario: salario,
    );
    
    // Guardar en el diccionario
    datosempleado[id] = nuevoEmpleado;
    
    // Incrementar el ID para el próximo empleado
    nextId++;
  }
}
