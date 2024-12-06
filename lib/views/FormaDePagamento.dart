import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 2, 66),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Setinha branca
          onPressed: () {
            Navigator.pop(context); // Ação de voltar
          },
        ),
        title: const Text(
          'Formas de Pagamento',
          style: TextStyle(color: Colors.white), // Cor branca para o título
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod =
                        selectedPaymentMethod == 'PIX' ? null : 'PIX';
                  });
                },
                child: PaymentOption(
                  text: 'PIX',
                  isSelected: selectedPaymentMethod == 'PIX',
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod =
                        selectedPaymentMethod == 'Cartão de crédito'
                            ? null
                            : 'Cartão de crédito';
                  });
                },
                child: PaymentOption(
                  text: 'Cartão de crédito',
                  isSelected: selectedPaymentMethod == 'Cartão de crédito',
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: selectedPaymentMethod != null
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Forma de pagamento selecionada: $selectedPaymentMethod'),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 18, 2, 66),
                  disabledBackgroundColor: Colors.grey,
                ),
                child: const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Confirmar Pagamento',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
}

class PaymentOption extends StatelessWidget {
  final String text;
  final bool isSelected;

  const PaymentOption({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 18, 2, 66),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.transparent,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

