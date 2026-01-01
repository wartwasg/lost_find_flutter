import 'package:flutter/material.dart';
import 'package:found/shared_widgets/add_item.dart';
import 'package:found/shared_widgets/found.dart';
import 'package:found/shared_widgets/lost.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String page = "lost";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B68AB),
        title: const Text("Lost And Finds", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: page == "lost"
          ? LostPage()
          : page == "found"
          ? FoundPage()
          : AddItemForm(),
      drawer: drawerMethod(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4B68AB),
        onPressed: () {
          setState(() {
            page = "add";
          });
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Drawer drawerMethod(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF4B68AB),
              ),
              height: 40,
              child: InkWell(
                onTap: () {
                  setState(() {
                    page = "lost";
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
                    ),
                    Text("Lost", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Ink(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF4B68AB),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    page = "found";
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.sports, color: Colors.white),
                    ),
                    Text("Found", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
