import 'package:flutter/material.dart';

void main() {
  runApp(ScheduleScreenApp());
}

class ScheduleScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScheduleScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScheduleScreen extends StatelessWidget {
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
            // Topo: seta + "Marcações"
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Marcações',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Botões "Marcados" e "Finalizados"
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
                          'Marcados',
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
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Finalizados',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Ícone de sucesso e mensagem
            Icon(Icons.check_circle, color: Colors.greenAccent, size: 60),
            SizedBox(height: 16),
            Text(
              'VOCÊ MARCOU COM SUCESSO!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 24),

            // Informações da marcação
            Text(
              'Amanhã - 12:00h',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              'Shelby Barber',
              style: TextStyle(color: Colors.white70, fontSize: 16),
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
                  navIcon(Icons.bookmark), // salvar
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
