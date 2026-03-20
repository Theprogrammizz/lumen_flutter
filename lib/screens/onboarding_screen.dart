import 'package:flutter/material.dart';
import 'package:lumen_flutter/screens/name_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Welcome!", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
          ),

          SizedBox(height: 20,),

          ElevatedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NameScreen(),));
          }, child: Text("Open Diary"))
        ],
      ),
    );
  }
}