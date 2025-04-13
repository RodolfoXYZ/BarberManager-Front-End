import 'package:flutter/material.dart';

class welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/imgwelcome.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BEM VINDO",
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, height: 0.9),

              ),
              SizedBox(width: 284, child:    Text(
                "Aqui você encontra os melhores preços.",
                style: TextStyle(color: Colors.white70, fontFamily: "Poppins", 
                fontSize: 18, 
                ), 
                textAlign: TextAlign.center,
                
              ),),
              SizedBox(height: 10,),
             SizedBox(
                width: 210,
                height: 36,
                child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color.fromRGBO(23, 23, 180, 1)) ,
                 shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                  )
                 )
                ),
                child: Text("Entrar", 
                style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
