import 'package:flutter/material.dart';

class DetalleVehiculo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle del Vehículo"),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen del vehículo
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                "assets/auto.png", // Reemplazar con imagen real
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Detalles del vehículo
            Text(
              "Marca: Toyota",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            Text(
              "Modelo: Corolla",
              style: TextStyle(fontSize: 22, color: Colors.black87),
            ),
            Text(
              "Año: 2021",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              "Disponible",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            // Botón de alquilar
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/medioPago'); // Redirige a la pantalla de pago
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Alquilar Vehículo",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
