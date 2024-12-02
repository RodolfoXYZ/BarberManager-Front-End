import 'package:flutter/material.dart';
import 'package:barbershop_app/views/HomePage.dart'; // Importe a HomePage

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final Map<String, bool> _selectedServices = {
    "Cabelo": false,
    "Barba e Bigode": false,
    "Sobrancelha": false,
  };
  String? _serviceLocation;

  void _onContinuePressed() {
    if (_selectedServices.values.every((isSelected) => !isSelected)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selecione pelo menos um serviço.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (_serviceLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selecione onde será realizado o serviço.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione o Serviço e o Local desejado'),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 2, 66),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSection(
                    title: 'Escolha o tipo de serviço desejado',
                    content: Column(
                      children: _selectedServices.keys.map((service) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          child: CheckboxListTile(
                            title: Text(service,
                                style: const TextStyle(fontSize: 16)),
                            value: _selectedServices[service],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (isSelected) {
                              setState(() {
                                _selectedServices[service] =
                                    isSelected ?? false;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  _buildSection(
                    title: 'Escolha onde será realizado o serviço',
                    content: Column(
                      children: [
                        RadioListTile<String>(
                          title: const Text('À Domicílio'),
                          value: 'domicilio',
                          groupValue: _serviceLocation,
                          onChanged: (value) {
                            setState(() {
                              _serviceLocation = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Presencial'),
                          value: 'presencial',
                          groupValue: _serviceLocation,
                          onChanged: (value) {
                            setState(() {
                              _serviceLocation = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _onContinuePressed,
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

  Widget _buildSection({required String title, required Widget content}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
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
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12.0),
          content,
        ],
      ),
    );
  }
}
