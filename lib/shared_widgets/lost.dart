import 'package:flutter/material.dart';
import 'package:found/model/item.dart';

class LostPage extends StatefulWidget {
  const LostPage({super.key});

  @override
  State<LostPage> createState() => _LostPageState();
}

class _LostPageState extends State<LostPage> {
  late Future<List<Item>> futureLost;
  @override
  void initState() {
    super.initState();
    futureLost = fetchLost();
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: deviceW,
        child: FutureBuilder<List<Item>>(
          future: futureLost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final item = snapshot.data!;
              print("successful");
              return listBuilder(item);
            } else if (snapshot.hasError) {
              final item = itemsNodata;
              print("failed1");
              return listBuilder(item);
            } else {
              final item = itemsNodata;
              print("failed2");
              return listBuilder(item);
            }
          },
        ),
      ),
    );
  }

  ListView listBuilder(List<Item> item) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: item.length,
      itemBuilder: (context, index) {
        Item current = item[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Text(current.name),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("description", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Text(current.description),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("location", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Text(current.location),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("date", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Text(current.date),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
