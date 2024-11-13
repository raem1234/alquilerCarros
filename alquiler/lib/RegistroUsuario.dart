import 'package:flutter/material.dart';

class RegistroUsuario extends StatefulWidget {
  @override
  _RegistroUsuarioState createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  void _registrarUsuario() {
    // Obtener los datos del usuario
    String nombre = _nombreController.text;
    String correo = _correoController.text;

    if (nombre.isNotEmpty && correo.isNotEmpty) {
      // Pasar los datos a la siguiente pantalla
      Navigator.pushNamed(context, '/perfil', arguments: {
        'nombre': nombre,
      });
    } else {
      // Mostrar mensaje de error si los campos están vacíos
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Por favor, completa todos los campos."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro de Usuario")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(hintText: "Nombre"),
            ),
            TextField(
              controller: _correoController,
              decoration: InputDecoration(hintText: "Correo"),
            ),
            TextField(
              controller: _contrasenaController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Contraseña"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registrarUsuario,
              child: Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}
