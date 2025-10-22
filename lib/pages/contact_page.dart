import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacted Hospitals",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
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
                              IconButton(onPressed: () {}, icon:  Icon(Icons.call, color: Colors.green, size: 40)),
                              Icon(Icons.message, color: Colors.blue, size: 40),
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
                "Spring of Life Clinic",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("14th November, 2025"),
            ),
          ),
        ],
      ),
    );
  }
}
