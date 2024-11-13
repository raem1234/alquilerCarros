import 'package:flutter/material.dart';

class InicioSesion extends StatefulWidget {
  @override
  _InicioSesionState createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final String usuarioValido = "usuario@correo.com";
  final String passwordValida = "contraseña123";

  // Variables para registrar un nuevo usuario
  String? nombreRegistrado;
  String? usuarioRegistrado;
  String? contrasenaRegistrada;

  void _iniciarSesion() {
    if (_emailController.text == usuarioRegistrado &&
        _passwordController.text == contrasenaRegistrada) {
      Navigator.pushReplacementNamed(
          context, '/menuPrincipal'); // Redirigir a '/menuPrincipal'
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Usuario o contraseña incorrectos"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Aceptar"),
            ),
          ],
        ),
      );
    }
  }

  // Método para abrir la ventana modal de registro
  void _abrirVentanaDeRegistro() {
    showDialog(
      context: context,
      builder: (context) {
        final _nombreController = TextEditingController();
        final _usuarioController = TextEditingController();
        final _contrasenaController = TextEditingController();

        return AlertDialog(
          title: Text("Registrar Usuario"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              TextField(
                controller: _usuarioController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              TextField(
                controller: _contrasenaController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Validar que todos los campos están completos
                if (_nombreController.text.isEmpty ||
                    _usuarioController.text.isEmpty ||
                    _contrasenaController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Por favor, completa todos los campos")),
                  );
                } else {
                  // Guardar los datos de registro
                  setState(() {
                    nombreRegistrado = _nombreController.text;
                    usuarioRegistrado = _usuarioController.text;
                    contrasenaRegistrada = _contrasenaController.text;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Usuario registrado exitosamente")),
                  );
                }
              },
              child: Text("Registrar"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  void _recuperarContrasena() {
    final email = _emailController.text;
    if (email.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Correo de recuperación enviado a $email")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ingresa un correo electrónico válido")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text("Bienvenido",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent)),
            Text("Inicia sesión para continuar",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 40),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                labelStyle: TextStyle(color: Colors.blueAccent),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.blueAccent),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _iniciarSesion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text("Iniciar Sesión", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _recuperarContrasena,
              child: Text("¿Olvidaste tu contraseña?",
                  style: TextStyle(color: Colors.blueAccent)),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _abrirVentanaDeRegistro,
              child: Text("¿No tienes cuenta? Registrarse",
                  style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        ),
      ),
    );
  }
}
