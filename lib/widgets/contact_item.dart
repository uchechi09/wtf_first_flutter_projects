import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactitem extends StatefulWidget {
  const Contactitem({
    super.key,
  });

  @override
  State<Contactitem> createState() => _ContactitemState();
}

class _ContactitemState extends State<Contactitem> {
  List<String> history = [];

  void makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: "tel", path: phoneNumber);
    await launchUrl(launchUri);
    addToHistory("Called Hospital");
  }

  void sendSMS(String message) async {
    final Uri smsUri = Uri(
      scheme: "sms",
      queryParameters: <String, String>{"body": message},
    );
    if(!await launchUrl(smsUri)){
      throw "could not launch sms app";
    }
    addToHistory("Message Sent");
  }

  void addToHistory(String event) {
    setState(() {
      history.add("$event . ${TimeOfDay.now().format(context)}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "String of Life Hospital",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Naze by Poly Junction,Owerri",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.green.shade200),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                         makePhoneCall("08128005089");
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.green,
                            size: 40,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.shade50,
                          shape: BoxShape.rectangle,
                        ),
                        child: IconButton(
                          onPressed: () {
                           sendSMS("I need an urgent ambulance");
                          },
                          icon: Icon(
                            Icons.message,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
    
                  Text("History", textAlign: TextAlign.left),
                  Text("No History Yet!", textAlign: TextAlign.right),
                ],
              ),
            );
          },
        );
      },
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.add_box_outlined),
      ),
      title: Text(
        "Spring of Life Hospital",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("14th November, 2025"),
    );
  }
}
