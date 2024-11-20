import 'package:barbershop_app/views/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cor de fundo da tela principal
      backgroundColor:
          Colors.transparent, // Para deixar a imagem de fundo visível

      // Barra superior
      appBar: AppBar(
        backgroundColor: Colors.blue[900], // Cor igual à da tela
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
          image: DecorationImage(
            image: AssetImage(
                'assets/logo.png'), // Caminho atualizado para a nova imagem
            fit: BoxFit.cover, // A imagem vai cobrir toda a tela
            colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0.4),
                BlendMode.darken), // Cor azul com opacidade ajustada
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Card da oferta do dia
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
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
            SizedBox(height: 50), // Espaço para os ícones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Ícone de corte dentro de uma bola azul mais clara
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[300], // Cor azul mais clara
                      ),
                      child: Icon(
                        Icons.content_cut, // Ícone de corte de cabelo
                        color: Colors.white, // Cor do ícone
                        size: 40, // Tamanho do ícone
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Corte',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                // Ícone de barba dentro de uma bola azul mais clara (agora igual ao de cabelo)
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[300], // Cor azul mais clara
                      ),
                      child: Icon(
                        Icons
                            .face, // Ícone de cabelo/rosto, que é o mais adequado para barba também
                        color: Colors.white, // Cor do ícone
                        size: 40, // Tamanho do ícone
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Barba',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                // Ícone de sobrancelha (alterado de "cabelo" para "sobrancelha")
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[300], // Cor azul mais clara
                      ),
                      child: Icon(
                        Icons.face, // O mesmo ícone de rosto para sobrancelha
                        color: Colors.white, // Cor do ícone
                        size: 40, // Tamanho do ícone
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Sobrancelha',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      // Barra inferior azul com ícones brancos
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900], // Barra inferior azul
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
