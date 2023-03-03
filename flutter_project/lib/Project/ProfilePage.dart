import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // addition of images
  String avatarUrl = "";
  List<String> imagePost =[

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.redAccent ,
        elevation: 0.0,
        title: Text(
          "Profile Page",
          style: TextStyle(
            color: Colors.yellow,

          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 44,
            backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Jordy Jordan",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 18,

              ),

            ),
            Text(
              "@Jordy96Jordan",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Followers",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text("23k",style: TextStyle(
                          fontSize: 16.0,

                        ),)

                      ],
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
