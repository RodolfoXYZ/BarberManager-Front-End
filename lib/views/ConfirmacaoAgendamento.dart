import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final DateTime selectedDate = DateTime.now();
  final String selectedTime = '10:00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 2, 66),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Confirmação de Agendamento',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Resumo do Agendamento',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Data: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Horário: $selectedTime',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Serviço: Corte de Cabelo',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            EvaluationSelection(),
            const SizedBox(height: 30),
            Expanded(child: Container()),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Agendamento Confirmado!'),
                      content: const Text(
                          'Seu agendamento foi confirmado com sucesso.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
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
                      'CONFIRMAR',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EvaluationSelection extends StatefulWidget {
  @override
  _EvaluationSelectionState createState() => _EvaluationSelectionState();
}

class _EvaluationSelectionState extends State<EvaluationSelection> {
  String selectedEvaluation = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Avalie sua experiência:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedEvaluation = 'Péssimo';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Péssimo'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedEvaluation = 'Ruim';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text('Ruim'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedEvaluation = 'Regular';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text('Regular'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedEvaluation = 'Bom';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text('Bom'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedEvaluation = 'Ótimo';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: const Text('Ótimo'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (selectedEvaluation.isNotEmpty)
          Text(
            '$selectedEvaluation',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 10),
        if (selectedEvaluation.isNotEmpty)
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedEvaluation = '';
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            child: const Text('Remover'),
          ),
      ],
    );
  }
}
