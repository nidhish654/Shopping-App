import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50
              ),
              const SizedBox(height: 10),
              Text(
                  "John Doe",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
              ),
              Text(
                  "john.doe@gmail.com",
                  style: GoogleFonts.poppins(
                  fontSize: 18,
              ),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                trailing: Icon(Icons.chevron_right),
                title: Text("Edit Profile", ),
                subtitle: Text("Update your username"),
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag),
                trailing: Icon(Icons.chevron_right),
                title: Text("My Orders"),
                subtitle: Text("Track your orders"),
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: () {}, child: Text("Sign Out")),
            ],
          ),
        ),
      ),
    );
  }
}
