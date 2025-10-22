import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wtf_flutter_projects/widgets/custom_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int activeindex = 0;
  
List<OnboardingItem> items = [
OnboardingItem(
      title: "Welcome to MediEmergi",
      subtitle:
          "We help you make ambulance requests for emergency and other purposes.",
      asset: "assets/onboarding.png"),

 OnboardingItem(title:"Find Nearby Ambulance",
 subtitle: "Easily locate available ambulances and hospitals in your vicinity using the app's map view.",
  asset:"assets/alert.png"),
  
    OnboardingItem(title: "Get the Best Experience",
     subtitle: "Complete your profile to enjoy the fastest means of getting emergency health care.",
      asset:"assets/complete.jpg"),
];

  @override
  Widget build(BuildContext context) {
    var onboardingItemToShow = items[activeindex];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Customeindicator(indicatorCount: items.length,activeindex: activeindex
           ),
          Image.asset(onboardingItemToShow.asset, width: 300, height: 300),
          Text(
            onboardingItemToShow.title,
            style: GoogleFonts.andika(fontWeight: FontWeight.w900, fontSize: 28)
            
          ),
          Text(
            onboardingItemToShow.subtitle,
            style: GoogleFonts.k2d(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            activeindex <= 0
                ? SizedBox(height: 0, width: 0)
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeindex = activeindex - 1;
                      });
                    },
                    child: Text("Back"),
                  ),

            ElevatedButton(
              onPressed: () {
                if(activeindex < items.length -1 ){
                setState(() {
                  activeindex = activeindex + 1;
                });
                }else{
                  Navigator.of(context).pushReplacementNamed("/home");
                }
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}


class OnboardingItem {
  String title;
  String subtitle;
  String asset;

OnboardingItem({
  required this.title,
  required this.subtitle,
  required this.asset,
});
}