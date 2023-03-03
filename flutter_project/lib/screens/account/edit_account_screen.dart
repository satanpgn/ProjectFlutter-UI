import 'package:flutter/material.dart';
// WIP
class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/Pics/multimedia.jpeg",
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text("_auth.loggedInUser == null ? "" : _auth.loggedInUser!.email.toString()"),
          ),
          SizedBox(
            height: 10,
          ),
          makeSettings(
              icon: Icon(Icons.logout),
              title: "Logout",
              subtitle: "Logout from this application",
              onTap: (){
                  logout();
              }
          ),
          makeSettings(
              icon: Icon(Icons.android),
              title: "Version",
              subtitle: "0.0.1",
              onTap: (){

              }
          ),
          makeSettings(
              icon: Icon(Icons.android),
              title: "FAQ'S",
              subtitle: "Comment",
              onTap: (){

              }
          ),
        ],
      ),
    );
  }

  makeSettings({required Icon icon, required String title, required String subtitle, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
            elevation: 4,
            color: Colors.white,
            child: ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.5),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                leading: icon,
                title: Text(
                  title,
                ),
                subtitle: Text(
                  subtitle,
                ))),
      ),
    );
  }

  void logout() {}
}

