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
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(34.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                SizedBox(height: 25),
                Text(
                  'Crie sua conta',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  controller: nomeController,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'Nome de Usuário',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: celularController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'Celular',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: dataNascimentoController,
                  keyboardType: TextInputType.datetime,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'Data de Nascimento',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: senhaController,
                  obscureText: true,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: confirmarSenhaController,
                  obscureText: true,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'Confirme a Senha',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),
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
      ),
    );
  }
}
