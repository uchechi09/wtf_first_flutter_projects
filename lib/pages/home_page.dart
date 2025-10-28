import 'package:flutter/material.dart';
import 'package:wtf_flutter_projects/widgets/contact_item.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediEmergi"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Map "),
                Tab(text: "List"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  InteractiveViewer(
                    child: Image.asset("assets/map.jpg", fit: BoxFit.fitWidth,)),
                  _buildListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView(
      children: [
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
        Contactitem(),
      ],
    );
  }
}
