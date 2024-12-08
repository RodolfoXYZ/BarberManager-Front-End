import 'package:barbershop_app/views/agendamento.dart';
import 'package:flutter/material.dart';

class BarberListScreen extends StatefulWidget {
  @override
  _BarberListScreenState createState() => _BarberListScreenState();
}

class _BarberListScreenState extends State<BarberListScreen> {
  final List<Map<String, String>> barbers = [
    {
      'name': 'João Silva',
      'image': 'assets/barber1.png',
      'courses': 'Curso Profissional de Barbeiro, Design de Barba'
    },
    {
      'name': 'Carlos Pereira',
      'image': 'assets/barber2.png',
      'courses': 'Corte Clássico, Alisamento Masculino'
    },
    {
      'name': 'Gabriel Lemos',
      'image': 'assets/barber3.png',
      'courses': 'Técnicas Modernas de Corte, Barboterapia'
    },
    {
      'name': 'Lucas Oliveira',
      'image': 'assets/barber4.png',
      'courses': 'Cortes Degradê, Barba Italiana'
    },
    {
      'name': 'Marcos Lima',
      'image': 'assets/barber5.png',
      'courses': 'Estilo Afro, Desenho Capilar'
    },
  ];

  int? selectedBarberIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Barbeiros a Domicílio',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF120242),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: barbers.length,
                itemBuilder: (context, index) {
                  return _buildBarberCard(barbers[index], index);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: selectedBarberIndex != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgendamentoPage(selectedServices: {"barba": true}, serviceLocation: "Jaboatão",)),
                      );
                      String barberName =
                          barbers[selectedBarberIndex!]['name']!;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('O barbeiro $barberName foi selecionado!'),
                          backgroundColor: const Color(0xFF120242),
                        ),
                      );
                    }
                  : null,
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
                    'CONFIRMAR',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarberCard(Map<String, String> barber, int index) {
    bool isSelected = selectedBarberIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBarberIndex = index;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(barber['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            barber['name']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF120242),
            ),
          ),
          subtitle: Text(
            barber['courses']!,
            style: TextStyle(color: Colors.grey[700]),
          ),
          trailing: Icon(
            isSelected ? Icons.check_circle : Icons.circle_outlined,
            color: isSelected ? Colors.green : const Color(0xFF120242),
          ),
        ),
      ),
    );
  }
}
