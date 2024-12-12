import 'package:barbershop_app/views/ConfirmacaoAgendamento.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final Map<String, bool> selectedServices;
  final String? serviceLocation;
  final DateTime selectedDate;
  final String selectedTime;
  final Map<String, String> selectedBarber; 

  PaymentPage({
    Key? key,
    required this.selectedServices,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedBarber, 
    this.serviceLocation,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;

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
          'Formas de Pagamento',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                        isSelected:
                            selectedPaymentMethod == 'Cartão de crédito',
                      ),
                    ),
                    const SizedBox(height: 45),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: selectedPaymentMethod != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationPage(
                              selectedDate: widget.selectedDate,
                              selectedTime: widget.selectedTime,
                              selectedServices: widget.selectedServices,
                              serviceLocation: widget.serviceLocation,
                              selectedBarber: widget
                                  .selectedBarber, 
                            ),
                          ),
                        );
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
