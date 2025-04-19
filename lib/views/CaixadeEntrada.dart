import 'package:flutter/material.dart';

void main() {
  runApp(InboxScreenApp());
}

class InboxScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InboxScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InboxScreen extends StatelessWidget {
  Widget messageTile(String avatarUrl, String message) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue, // cor igual ao botão "Mensagens"
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
            radius: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget navIcon(IconData icon) {
    return Icon(icon, color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Topo: seta + "Caixa de Entrada"
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Caixa de Entrada',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Botões "Mensagens" e "Ligações"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Mensagens',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900, // azul mais escuro
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Ligações',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Lista de mensagens
            messageTile(
              'https://i.pravatar.cc/150?img=1',
              'Cadê você mano? tá atrasado.',
            ),
            messageTile(
              'https://i.pravatar.cc/150?img=2',
              'Não vou poder tenho uns assuntos de família pra resolver.',
            ),

            Spacer(),

            // Linha azul
            Container(height: 2, color: Colors.blue),

            // Ícones de navegação inferior
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navIcon(Icons.home),
                  navIcon(Icons.chat),
                  navIcon(Icons.bookmark), // bandeira = salvar
                  navIcon(Icons.settings),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
