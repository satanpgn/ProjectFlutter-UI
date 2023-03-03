import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,

      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search For Gadget",
            style: TextStyle(
                color: Colors.red,
            fontSize:16.0,
                fontWeight: FontWeight.normal,
            ),
            ),
            SizedBox(
              height: 12.0,
              width: 12.0,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.deepPurpleAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                  borderSide: BorderSide.none,

                ),
                hintText: "MacBook-Pro 8/256 13",
                suffixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple,

              ),
              

            )
          ],
        ),
      ),
    );
  }
}
