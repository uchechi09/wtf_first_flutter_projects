import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Image.asset("assets/onboarding.png", width: 450, height: 450),
          Text(
            "Welcome To MediCall",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
            "We help you make ambulace request for emergencies and other purposes.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          
          ),
                    
               ],
          ),
      
    
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: (){}, child: Text("Back"),),
                ElevatedButton(onPressed: (){}, child: Text("Next"),),           
                         ],    
        ),
      ),
    );
  }

}
