import 'package:barbershop_app/views/LoginPage.dart';
import 'package:barbershop_app/views/lista-agendamentos.dart';
import 'package:flutter/material.dart';

import 'ServicePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 2, 66),
        actions: [
          IconButton(
            icon:
                Icon(Icons.notifications, color: Colors.white), // Ícone de sino
            onPressed: () {},
          ),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Card da oferta do dia
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Oferta do Dia',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Corte de cabelo por apenas R\$ 25,00!',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Endereço: Rua Principal, 123',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50), // Espaço entre o card e o botão

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 18, 2, 66),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      'ESCOLHER SERVIÇOS',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AgendamentosUsuarioPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 18, 2, 66),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      'MEUS AGENDAMENTOS',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Barra inferior azul com ícones brancos
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 18, 2, 66),
        selectedItemColor: Colors.white, // Cor dos ícones selecionados
        unselectedItemColor: Colors.white, // Cor dos ícones não selecionados
        type: BottomNavigationBarType.fixed, // Layout fixo
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '', // Remover o texto
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '', // Remover o texto
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag), // Ícone de bandeira
            label: '', // Remover o texto
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '', // Remover o texto
          ),
        ],
      ),
    );
  }
}
