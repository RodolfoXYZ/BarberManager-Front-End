import 'package:barbershop_app/views/LoginPage.dart';
import 'package:barbershop_app/views/lista-agendamentos.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'ServicePage.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> barbers = [
    {
      'name': 'João Silva',
      'image': 'assets/barber1.png',
      'courses': 'Curso Profissional de Barbeiro, Design de Barba',
    },
    {
      'name': 'Carlos Pereira',
      'image': 'assets/barber2.png',
      'courses': 'Corte Clássico, Alisamento Masculino',
    },
    {
      'name': 'Gabriel Lemos',
      'image': 'assets/barber3.png',
      'courses': 'Técnicas Modernas de Corte, Barboterapia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao BarberManager!'),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(0xFF120242),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Meus Próximos Agendamentos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Ver todos',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => AgendamentosUsuarioPage())
                      );
                    }),
            ]),
          ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading:
                        const Icon(Icons.calendar_today, color: Colors.blue),
                    title: const Text(
                      'Corte de Cabelo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Hoje às 15h com João Silva'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServicePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF120242),
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
                const SizedBox(height: 20),
                const Text(
                  'Melhores Barbeiros',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: barbers.length,
                    itemBuilder: (context, index) {
                      return _buildBarberCard(barbers[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF120242),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildBarberCard(Map<String, String> barber) {
    return Card(
      margin: const EdgeInsets.only(right: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(barber['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              barber['name']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF120242),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              barber['courses']!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
