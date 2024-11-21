import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CuttingScreen(),
    );
  }
}

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
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
         
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imgfundo.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
              ),
            ),
          ),

          
          Positioned(
            top: 30,
            right: 20,
            child: Text(
              'Serviço',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 14, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(height: 100), 

                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildToggleButton("A domicílio", !isPresencial, () {
                        setState(() {
                          isPresencial = false;
                        });
                      }, 'assets/adomicilio.png', 146, 134, 192, -5, true),
                      SizedBox(width: 15), 
                      _buildToggleButton("Presencial", isPresencial, () {
                        setState(() {
                          isPresencial = true;
                        });
                      }, 'assets/degrade.png', 146, 134, 184, 168, false),
                    ],
                  ),
                  SizedBox(height: 20), 

                 
                  Text(
                    "Detalhe o corte desejado",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),

              
                  TextField(
                    maxLines: 1, 
                    decoration: InputDecoration(
                      hintText: "Descreva aqui...",
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 20),

                  
                  Text(
                    "Incluir no corte",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,  
                    children: [
                      _buildServiceButton('assets/barba.png', () {
                        setState(() {
                          isBarbaSelected = true;        
                          isSobrancelhaSelected = false;
                        });
                      }, isBarbaSelected),
                      SizedBox(width: 10), 
                      _buildServiceButton('assets/sobrancelha.png', () {
                        setState(() {
                          isSobrancelhaSelected = true;  
                          isBarbaSelected = false;      
                        });
                      }, isSobrancelhaSelected),
                    ],
                  ),

                  
                  SizedBox(height: 50), 
                  Center(  
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, 
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Continuar",
                        style: TextStyle(
                          color: Colors.black, 
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }


  Widget _buildServiceButton(String imagePath, VoidCallback onPressed, bool isSelected) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: isSelected
              ? [BoxShadow(color: Color(0xFF120242), blurRadius: 10, spreadRadius: 3)] 
              : [],
        ),
        child: Image.asset(
          imagePath,
          width: 100, 
          height: 100, 
        ),
      ),
    );
  }

  Widget _buildToggleButton(
    String label,
    bool isSelected,
    VoidCallback onTap,
    String imagePath,
    double width,
    double height,
    double top,
    double left,
    bool isAdomicilio, 
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Positioned(
        top: top,
        left: left,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isAdomicilio ? Colors.grey : Colors.transparent, 
                borderRadius: BorderRadius.circular(13), 
              ),
              child: Image.asset(
                imagePath,
                width: width, 
                height: height, 
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue[900] : Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: isSelected ? Colors.blue[900]! : Colors.white),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
