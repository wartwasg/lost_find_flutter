import 'dart:convert';
import 'package:http/http.dart' as http;

class Item {
  String name;
  String description;
  String location;
  String date;
  String type;
  Item(this.name, this.description, this.location, this.date, this.type);
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      json['name'],
      json['description'],
      json['location'],
      json['lostDate'],
      json['type'],
    );
  }
}

List<Item> itemsLost = [
  Item("hand bag", "this was lost at COED", "Ng'ong'ona", "12/12/2025", "lost"),
];
List<Item> itemsNodata = [Item("Empty", "Empty", "Empty", "Empty", "Empty")];
List<Item> itemsFind = [
  Item("phone", "this item was lost at the chimwaga party", "SCHSS", "28/12/2025", "found"),
];

Future<List<Item>> fetchFound() async {
  final uri = Uri.parse("http://localhost:8080/api/user/item-list/found");
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    var json = response.body;
    List<dynamic> list = jsonDecode(json);
    return list.map((e) => Item.fromJson(e)).toList();
  } else {
    throw Exception("Failed to fetch data");
  }
}

Future<List<Item>> fetchLost() async {
  final uri = Uri.parse("http://localhost:8080/api/user/item-list/lost");
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    var json = response.body;
    List<dynamic> list = jsonDecode(json);
    return list.map((e) => Item.fromJson(e)).toList();
  } else {
    throw Exception("failed to fetch data");
  }
}

Future<void> postFoundItem(Item item) async {
  final uri = Uri.parse("http://localhost:8080/api/user/add-item");
  var request = await http.post(
    uri,
    headers: {'Content-type': 'application/json'},
    body: jsonEncode(toJson(item)),
  );
  if (request.statusCode == 200) {
    print("successful saved");
  } else {
    print("failed to save ${request.statusCode}");
  }
}

Map<String, dynamic> toJson(Item item) {
  return {
    "name": item.name,
    "description": item.description,
    "location": item.location,
    "lostDate": item.date,
    "type": item.type,
  };
}
