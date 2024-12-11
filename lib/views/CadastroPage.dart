import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController celularController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  void cadastrar(BuildContext context) {
    if (nomeController.text.isEmpty ||
        emailController.text.isEmpty ||
        celularController.text.isEmpty ||
        dataNascimentoController.text.isEmpty ||
        senhaController.text.isEmpty ||
        confirmarSenhaController.text.isEmpty) {
      mostrarSnackBar(context, 'Por favor, preencha todos os campos');
      return;
    }

    if (senhaController.text != confirmarSenhaController.text) {
      mostrarSnackBar(context, 'As senhas não coincidem');
      return;
    }

    mostrarSnackBar(context, 'Conta criada com sucesso!');
  }

  void mostrarSnackBar(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
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
          color: null,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            children: [
              Image.asset('assets/logo.png'),
              SizedBox(height: 25),
              Text(
                'Crie sua conta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 18, 2, 66),
                ),
              ),
              SizedBox(height: 25),
              campoTexto(nomeController, 'Nome de Usuário', TextInputType.text),
              SizedBox(height: 10),
              campoTexto(emailController, 'E-mail', TextInputType.emailAddress),
              SizedBox(height: 10),
              campoTexto(celularController, 'Celular', TextInputType.phone),
              SizedBox(height: 10),
              campoTexto(dataNascimentoController, 'Data de Nascimento',
                  TextInputType.datetime),
              SizedBox(height: 10),
              campoTexto(
                  senhaController, 'Senha', TextInputType.visiblePassword,
                  obscureText: true),
              SizedBox(height: 10),
              campoTexto(confirmarSenhaController, 'Confirme a Senha',
                  TextInputType.visiblePassword,
                  obscureText: true),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => cadastrar(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 18, 2, 66),
                ),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget campoTexto(TextEditingController controller, String labelText,
      TextInputType keyboardType,
      {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 219, 219, 219).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
