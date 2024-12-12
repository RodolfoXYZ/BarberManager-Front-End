import 'package:barbershop_app/views/FormaDePagamento.dart';
import 'package:flutter/material.dart';

class AgendamentoPage extends StatefulWidget {
  final Map<String, bool> selectedServices;
  final String? serviceLocation;
  final Map<String, String> selectedBarber;

  AgendamentoPage({
    required this.selectedServices,
    required this.serviceLocation,
    required this.selectedBarber,
  });

  @override
  _AgendamentoPageState createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  DateTime? _selectedDate;
  String? _selectedTime;

  void _pickDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _selectTime(String time) {
    setState(() {
      if (_selectedTime == time) {
        _selectedTime = null;
      } else {
        _selectedTime = time;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Usando os dados passados da BarberSelectionPage
    final selectedBarber = widget.selectedBarber;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Ajusta o layout ao aparecer o teclado
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Exibindo os serviços selecionados
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Serviço(s) Selecionado(s):',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  for (var entry in widget.selectedServices.entries)
                    if (entry.value)
                      Text(entry.key, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 20),
                  Text(
                    'Local de Serviço: ${widget.serviceLocation ?? 'Não especificado'}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Exibindo a seleção da data
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Selecione a data disponível',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
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
                ],
              ),
            ),
            SizedBox(height: 20),
            // Exibindo os horários disponíveis
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Horários Disponíveis',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          onPressed: () => _selectTime(time),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedTime == time
                                ? Colors.blue
                                : Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            time,
                            style: TextStyle(
                                color: _selectedTime == time
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Botão para finalizar o agendamento
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _selectedDate != null && _selectedTime != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              selectedDate: _selectedDate!,
                              selectedTime: _selectedTime!,
                              selectedServices: widget.selectedServices,
                              serviceLocation: widget.serviceLocation,
                              selectedBarber:
                                  selectedBarber, // Passando os dados do barbeiro
                            ),
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
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'FINALIZAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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
