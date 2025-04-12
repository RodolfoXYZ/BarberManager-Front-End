import 'package:flutter/material.dart';

class PesquisaTipoPage extends StatelessWidget {
  const PesquisaTipoPage({Key? key}) : super(key: key);

  void navegarParaCatalogo(BuildContext context, String tipoSelecionado) {
    Navigator.pushNamed(
      context,
      '/homepage', // ou alguma tela que receba o tipo como argumento
      arguments: {'tipo': tipoSelecionado},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF120242),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'O que deseja visualizar ao iniciar?',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 28,
              ),
            ),
            _opcaoCard(
              context,
              titulo: 'Procurar por Barbeiro',
              icone: Icons.person,
              cor: Colors.indigo.shade700,
              onTap: () => navegarParaCatalogo(context, 'barbeiro'),
            ),
            const SizedBox(height: 20),
            _opcaoCard(
              context,
              titulo: 'Procurar por Barbearia',
              icone: Icons.storefront,
              cor: Colors.deepPurple,
              onTap: () => navegarParaCatalogo(context, 'barbearia'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _opcaoCard(
    BuildContext context, {
    required String titulo,
    required IconData icone,
    required Color cor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: cor.withOpacity(0.05),
          ),
          child: Row(
            children: [
              Icon(icone, size: 50, color: cor),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: cor,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
