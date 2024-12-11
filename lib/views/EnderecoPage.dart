import 'package:flutter/material.dart';

class EnderecoPage extends StatelessWidget {
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController cepController = TextEditingController();

  void _onConfirmarPressed(BuildContext context) {
    if (enderecoController.text.isEmpty ||
        numeroController.text.isEmpty ||
        cepController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha os campos obrigatórios.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Endereço confirmado com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 18, 2, 66)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text(
                  'Cadastre o seu endereço',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 18, 2, 66),
                  ),
                ),
                SizedBox(height: 25),
                _buildTextField(
                  controller: enderecoController,
                  labelText: 'Endereço',
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: numeroController,
                  labelText: 'Número',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: complementoController,
                  labelText: 'Complemento (opcional)',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: cepController,
                  labelText: 'CEP',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => _onConfirmarPressed(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 18, 2, 66),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required TextInputType keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 219, 219, 219).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}
