import 'package:flutter/material.dart';

class CuttingScreen extends StatefulWidget {
  @override
  _CuttingScreenState createState() => _CuttingScreenState();
}

class _CuttingScreenState extends State<CuttingScreen> {
  bool isPresencial = true;
  bool isBarbaSelected = false;
  bool isSobrancelhaSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Serviço',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildToggleButton(
                          "A domicílio",
                          !isPresencial,
                          () => setState(() => isPresencial = false),
                          'assets/adomicilio.png'),
                      SizedBox(width: 15),
                      _buildToggleButton(
                          "Presencial",
                          isPresencial,
                          () => setState(() => isPresencial = true),
                          'assets/degrade.png'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Detalhe o corte desejado",
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                  SizedBox(height: 10),
                  _buildTextField(),
                  SizedBox(height: 20),
                  Text("Incluir no corte",
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildServiceButton(
                          'assets/barba.png',
                          () => setState(
                              () => isBarbaSelected = !isBarbaSelected),
                          isBarbaSelected),
                      SizedBox(width: 10),
                      _buildServiceButton(
                          'assets/sobrancelha.png',
                          () => setState(() =>
                              isSobrancelhaSelected = !isSobrancelhaSelected),
                          isSobrancelhaSelected),
                    ],
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 18, 2, 66),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text("Continuar",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 18, 2, 66),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Descreva aqui...",
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      style: TextStyle(color: Color.fromARGB(255, 18, 2, 66)),
    );
  }

  Widget _buildServiceButton(
      String imagePath, VoidCallback onPressed, bool isSelected) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: Color(0xFF120242),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ]
                : []),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(imagePath, width: 100, height: 100),
            if (isSelected)
              Positioned(
                  bottom: 5,
                  right: 5,
                  child:
                      Icon(Icons.check_circle, color: Colors.green, size: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(
      String label, bool isSelected, VoidCallback onTap, String imagePath) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: !isSelected ? Colors.grey[300] : Colors.transparent,
                borderRadius: BorderRadius.circular(13)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath, width: 120, height: 100),
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? Color.fromARGB(255, 18, 2, 66)
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: isSelected
                      ? Color.fromARGB(255, 18, 2, 66)
                      : Colors.grey),
            ),
            child: Text(label,
                style:
                    TextStyle(color: isSelected ? Colors.white : Colors.black)),
          ),
        ],
      ),
    );
  }
}
