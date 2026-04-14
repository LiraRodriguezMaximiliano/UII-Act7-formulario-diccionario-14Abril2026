import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.orange[800],
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const Column(
              children: [
                Text("Ferretería", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Text("el patito", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            color: Colors.orange[700],
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("buscar"), Text("|"),
                Text("sucursales"), Text("|"),
                Text("carrito"), Text("|"),
                Text("iniciar"),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text("GESTIÓN DE EMPLEADOS", 
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2)),
          
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network('https://cdn-icons-png.flaticon.com/512/3135/3135715.png', height: 100),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[800], 
                        minimumSize: const Size(double.infinity, 50)
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/captura'),
                      child: const Text("CAPTURAR EMPLEADO", style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[800], 
                        minimumSize: const Size(double.infinity, 50)
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/ver'),
                      child: const Text("VER EMPLEADOS", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}