import 'package:flutter/material.dart';

class PerfilUsuario extends StatefulWidget {
  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  String nombre = "Nombre del Usuario";
  String numeroLicencia = "1234567890";

  TextEditingController nombreController = TextEditingController();
  TextEditingController contrasenaActualController = TextEditingController();
  TextEditingController nuevaContrasenaController = TextEditingController();
  TextEditingController confirmarContrasenaController = TextEditingController();

  void _editarNombre() {
    setState(() {
      nombre = nombreController.text;
    });
    Navigator.of(context).pop();
  }

  void _cambiarContrasena() {
    if (nuevaContrasenaController.text == confirmarContrasenaController.text) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Contraseña Cambiada"),
            content: Text("La contraseña ha sido cambiada exitosamente."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Las contraseñas no coinciden."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil de Usuario"),
        backgroundColor: Color(0xFF006F9E), // Azul de la bandera
      ),
      body: Center(
        // Centrar todo el contenido
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centrar elementos en el eje vertical
            crossAxisAlignment: CrossAxisAlignment
                .center, // Centrar elementos en el eje horizontal
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: const Color.fromARGB(255, 137, 151, 177),
                child: Icon(Icons.person,
                    size: 60, color: const Color.fromARGB(255, 160, 90, 90)),
              ),
              SizedBox(height: 20),
              Text(
                nombre,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text("Número de Licencia: $numeroLicencia"),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 248, 249, 250), // Color azul
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  nombreController.text = nombre;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Editar Nombre"),
                        content: TextField(
                          controller: nombreController,
                          decoration: InputDecoration(hintText: "Nuevo nombre"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: _editarNombre,
                            child: Text("Guardar"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Editar Nombre"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 253, 253, 253), // Color azul
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Cambiar Contraseña"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: contrasenaActualController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Contraseña Actual"),
                            ),
                            TextField(
                              controller: nuevaContrasenaController,
                              obscureText: true,
                              decoration:
                                  InputDecoration(hintText: "Nueva Contraseña"),
                            ),
                            TextField(
                              controller: confirmarContrasenaController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Confirmar Nueva Contraseña"),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: _cambiarContrasena,
                            child: Text("Cambiar Contraseña"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Cambiar Contraseña"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
