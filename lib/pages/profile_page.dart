import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wtf_flutter_projects/model/user_details.dart';
import 'package:wtf_flutter_projects/pages/notifications_page.dart';
import 'package:wtf_flutter_projects/pages/payment_method_page.dart';
import 'package:wtf_flutter_projects/provider/user_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildprofiledetails(),
          _buildtextdettails(context),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildaccountsection(), SizedBox(height: 16)],
          ),
          ListTile(
            title: Text("Personal Information", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return PaymentMethodPage();
                  },
                ),
              );
            },
            title: Text("Payment Method", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return NotificationsPage();
                  },
                ),
              );
            },
            title: Text("Notifications", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
          ),
          Divider(),

          _buildsupportsections(context),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Column _buildsupportsections(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          title: Text("About Us", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          title: Text("Contact Us", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        SizedBox(height: 56),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 213, 152, 152),
            foregroundColor: Colors.red.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/login");
          },
          icon: Icon(Icons.logout),
          label: Text("Logout"),
        ),
      ],
    );
  }

  Text _buildaccountsection() {
    return Text(
      "Account",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Container _buildprofiledetails() {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: Image.asset("assets/profile_pic.jpeg", width: 100, height: 100),
    );
  }

  Widget _buildtextdettails(context) {
    UserDetails? user = Provider.of<UserCubit>(context).state;
    
    if (user == null) return Text("user details not set");
    return Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Text(
       user.email,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
        ),
      ],
    );
  }
}
