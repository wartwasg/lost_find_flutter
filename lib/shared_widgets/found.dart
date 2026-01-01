import 'package:flutter/material.dart';
import 'package:found/model/item.dart';

class FoundPage extends StatefulWidget {
  const FoundPage({super.key});

  @override
  State<FoundPage> createState() => _FoundPageState();
}

class _FoundPageState extends State<FoundPage> {
  late Future<List<Item>> futureItems;
  @override
  void initState() {
    super.initState();
    futureItems = fetchFound();
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: deviceW,
        child: FutureBuilder<List<Item>>(
          future: futureItems,
          builder: (context, snapshot) {
            final item = itemsNodata;
            if (snapshot.hasError) {
              return listBuilder(item);
            } else if (!snapshot.hasData) {
              return listBuilder(item);
            } else {
              final item = snapshot.data!;
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
