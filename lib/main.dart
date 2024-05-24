import 'package:depenseapk/views/inte1.dart';
import 'package:depenseapk/views/inte2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FinancesScreen(),
    );
  }
}

class FinancesScreen extends StatefulWidget {
  @override
  _FinancesScreenState createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  double _textOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _textOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gestion des dépenses',
          style: TextStyle(
            // fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/profile.jpg', width: 100, fit: BoxFit.cover,),
                SizedBox(height: 16),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 1000),
                  opacity: _textOpacity,
                  child: Text(
                    'Organisez vos dépenses et gardez le contrôle de votre argent avec notre application flexible et facile à utiliser.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.greenAccent,
                    fontWeight: FontWeight.bold
                    ),

                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      // Naviguer vers l'écran suivant
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Inte1();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Suivant'),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
