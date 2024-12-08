import 'package:flutter/material.dart';

class AgendamentosUsuarioPage extends StatefulWidget {
  @override
  _AgendamentosUsuarioPageState createState() =>
      _AgendamentosUsuarioPageState();
}

class _AgendamentosUsuarioPageState extends State<AgendamentosUsuarioPage> {


  final List<Map<String, String>> agendamentos = [
    {
      "service": "Corte Clássico",
      "date": "15/09/2024",
      "time": "14:30",
      "status": "Confirmado",
      "image": "assets/barber1.png"
    },
    {
      "service": "Barba Italiana",
      "date": "18/09/2024",
      "time": "16:00",
      "status": "Pendente",
      "image": "assets/barber2.png"
    },
    {
      "service": "Alisamento Masculino",
      "date": "20/09/2024",
      "time": "11:00",
      "status": "Cancelado",
      "image": "assets/barber3.png"
    },
    {
      "service": "Desenho Capilar",
      "date": "22/09/2024",
      "time": "10:00",
      "status": "Confirmado",
      "image": "assets/barber1.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Meus Agendamentos"),
        centerTitle: true,
        backgroundColor: Color(0xFF2D1E55), 
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: agendamentos.length,
              itemBuilder: (context, index) {
                final agendamento = agendamentos[index];
                return Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F1FF), 
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        agendamento['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      agendamento['service']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D1E55),
                      ),
                    ),
                    subtitle: Text(
                      "Data: ${agendamento['date']} • Horário: ${agendamento['time']}",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: _getStatusColor(agendamento['status']!),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        agendamento['status']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Visualização de agendamentos atualizada!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6D33A4),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Center(
                child: Text(
                  "ATUALIZAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Confirmado":
        return Colors.green;
      case "Pendente":
        return Colors.orange;
      case "Cancelado":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
