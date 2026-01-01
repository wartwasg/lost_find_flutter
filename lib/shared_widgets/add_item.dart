import 'package:flutter/material.dart';
import 'package:found/model/item.dart';

class AddItemForm extends StatefulWidget {
  const AddItemForm({super.key});

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  late TextEditingController name;
  late TextEditingController description;
  late TextEditingController location;
  late TextEditingController date;
  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    description = TextEditingController();
    location = TextEditingController();
    date = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    description.dispose();
    location.dispose();
    date.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Enter the item name",
                hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                prefixIcon: Icon(Icons.edit_outlined),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextField(
              controller: description,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Enter the item description",
                hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                prefixIcon: Icon(Icons.description),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextField(
              controller: location,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Enter the item location",
                hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextField(
              controller: date,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Enter the found date",
                hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                prefixIcon: Icon(Icons.date_range),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4B68AB),
              alignment: Alignment.center,
              iconColor: Colors.white,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              if (name.text.trim().isNotEmpty &&
                  description.text.trim().isNotEmpty &&
                  location.text.trim().isNotEmpty &&
                  date.text.trim().isNotEmpty) {
                Item item = Item(
                  name.text.trim(),
                  description.text.trim(),
                  location.text.trim(),
                  date.text.trim(),
                  "lost",
                );
                postFoundItem(item);
              } else {
                return;
              }
            },
            child: Row(children: [Icon(Icons.save), Text("Save Data")]),
          ),
        ],
      ),
    );
  }
}
