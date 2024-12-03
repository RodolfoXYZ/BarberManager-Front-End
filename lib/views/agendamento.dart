import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SchedulingPage(),
    );
  }
}

class SchedulingPage extends StatefulWidget {
  @override
  _SchedulingPageState createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  DateTime? _selectedDate;

  void _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 2, 66),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Selecione a Data do Serviço',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Botão para abrir o calendário
            ElevatedButton(
              onPressed: () => _pickDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                _selectedDate == null
                    ? 'Escolha uma data'
                    : 'Data selecionada: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),

            // Horários disponíveis
            Text(
              'Horários Disponíveis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (String time in [
                  '09:00',
                  '10:00',
                  '11:00',
                  '13:00',
                  '14:00',
                  '15:00'
                ])
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),

      // Botão "Finalizar" no final da tela
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Lógica ao finalizar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 18, 2, 66),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'FINALIZAR',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 18, 2, 66),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: [
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
        ],
      ),
    );
  }
}
