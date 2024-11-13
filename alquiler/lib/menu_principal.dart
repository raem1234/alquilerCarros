import 'package:flutter/material.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> autos = [
    {"marca": "Toyota", "modelo": "Corolla", "precio": "50", "dias": "1"},
    {"marca": "Honda", "modelo": "Civic", "precio": "60", "dias": "2"},
    {"marca": "Ford", "modelo": "Focus", "precio": "55", "dias": "3"},
    {"marca": "Chevrolet", "modelo": "Malibu", "precio": "70", "dias": "4"},
    {"marca": "BMW", "modelo": "X5", "precio": "150", "dias": "5"},
    {"marca": "Audi", "modelo": "Q7", "precio": "200", "dias": "6"},
    {"marca": "Mercedes", "modelo": "GLC", "precio": "180", "dias": "7"},
    {"marca": "Tesla", "modelo": "Model S", "precio": "300", "dias": "8"},
    {"marca": "Nissan", "modelo": "Altima", "precio": "65", "dias": "9"},
    {"marca": "Mazda", "modelo": "CX-5", "precio": "75", "dias": "10"},
    {"marca": "Kia", "modelo": "Optima", "precio": "80", "dias": "11"},
    {"marca": "Hyundai", "modelo": "Elantra", "precio": "50", "dias": "12"},
    {"marca": "Volkswagen", "modelo": "Jetta", "precio": "60", "dias": "13"},
    {"marca": "Subaru", "modelo": "Outback", "precio": "85", "dias": "14"},
    {"marca": "Porsche", "modelo": "911", "precio": "500", "dias": "15"},
  ];

  List<Map<String, String>> _filteredAutos = [];

  @override
  void initState() {
    super.initState();
    _filteredAutos = autos;
  }

  void _filtrarAutos(String query) {
    setState(() {
      _filteredAutos = autos
          .where((auto) =>
              auto['marca']!.toLowerCase().contains(query.toLowerCase()) ||
              auto['modelo']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _mostrarModal(BuildContext context, String marca, String modelo,
      String precio, String dias) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("$marca $modelo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Marca: $marca", style: TextStyle(fontSize: 16)),
              Text("Modelo: $modelo", style: TextStyle(fontSize: 16)),
              Text("Precio: \$${precio} / día", style: TextStyle(fontSize: 16)),
              Text("Días de alquiler: $dias", style: TextStyle(fontSize: 16)),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/medioPago');
              },
              child: Text("Alquilar Vehículo"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú Principal"),
        backgroundColor:
            Color(0xFF006F9E), // Color azul de la bandera de Colombia
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor:
                        Color.fromARGB(255, 255, 224, 0), // Amarillo
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text("Usuario",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF006F9E), // Color azul
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            ListTile(
              title: Text("Perfil", style: TextStyle(fontSize: 18)),
              onTap: () => Navigator.pushNamed(context, '/perfil'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filtrarAutos,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Color(0xFF006F9E)),
                hintText: "Buscar auto por marca o modelo",
                hintStyle: TextStyle(color: Color(0xFF006F9E)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _filteredAutos.length,
              itemBuilder: (context, index) {
                var auto = _filteredAutos[index];
                return GestureDetector(
                  onTap: () {
                    _mostrarModal(
                      context,
                      auto['marca']!,
                      auto['modelo']!,
                      auto['precio']!,
                      auto['dias']!,
                    );
                  },
                  child: Card(
                    elevation: 8, // Sombra 3D
                    shadowColor: Colors.black.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.directions_car,
                            size: 80, color: Color(0xFF006F9E)),
                        Text(auto['marca']!,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(auto['modelo']!,
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Text("\$${auto['precio']} / día",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF006F9E))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF006F9E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Usuario",
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/perfil');
          }
        },
      ),
    );
  }
}
