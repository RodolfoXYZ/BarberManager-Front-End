import 'package:barbershop_app/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'CadastroPage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void fazerLogin(BuildContext context) async {
    try {
      if (emailController.text.isEmpty || senhaController.text.isEmpty) {
        mostrarSnackBar(context, 'Por favor, preencha usuário e senha');
        return;
      }

      var user = true;

      if (user) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

        mostrarSnackBar(context, 'Login efetuado com sucesso!');
      } else {
        mostrarSnackBar(context,
            'E-mail e/ou senha incorretos. Favor, revise os dados e tente novamente!');
      }
    } catch (error) {
      mostrarSnackBar(context, 'Erro ao tentar fazer login. Tente novamente!');
    }
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              SizedBox(height: 25),
              Text(
                'Acessar conta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 18, 2, 66),
                ),
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 219, 219, 219)
                          .withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 219, 219, 219)
                          .withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: senhaController,
                  obscureText: true,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => fazerLogin(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 18, 2, 66),
                ),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: 'Não tem uma conta? ',
                  style: DefaultTextStyle.of(context).style.merge(
                        TextStyle(
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          decoration: TextDecoration.none,
                        ),
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Cadastre-se aqui.',
                      style: TextStyle(
                        color: Color(0xFF120242),
                        decoration: TextDecoration.none,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
