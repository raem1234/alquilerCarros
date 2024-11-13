import 'package:alquiler/detalle_vehiculo.dart';
import 'package:alquiler/inicio_sesion.dart';
import 'package:alquiler/medio_pago.dart';
import 'package:alquiler/menu_principal.dart';
import 'package:alquiler/perfil_usuario.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alquiler de Autos',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => InicioSesion(),
        '/menuPrincipal': (context) => MenuPrincipal(),
        '/perfil': (context) => PerfilUsuario(),
        '/detalleVehiculo': (context) => DetalleVehiculo(),
        '/medioPago': (context) => MedioPago(),
      },
    );
  }
}
