import 'package:flutter/material.dart';

class MedioPago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medio de Pago"),
        backgroundColor:
            Color(0xFF006F9E), // Color azul de la bandera de Colombia
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.blue),
            title: Text(
              "Tarjeta de Crédito/Débito",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Acción cuando se selecciona la tarjeta de crédito
            },
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.orange),
            title: Text(
              "PayPal",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Acción cuando se selecciona PayPal
            },
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.money, color: Colors.green),
            title: Text(
              "Transferencia Bancaria",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Acción cuando se selecciona Transferencia Bancaria
            },
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
