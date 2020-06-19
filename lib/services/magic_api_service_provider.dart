import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

//import 'package:magic_card_search/models/minimal_card.dart';

//import '../models/minimal_card.dart';
import 'package:magic_card_search/models/minimal_card.dart';

class MagicApiServiceProvider with ChangeNotifier {
  final String urlRaw = "https://api.magicthegathering.io/v1/cards";
  List<MinimalCard> respondedCards = [];

  void getCardByName(String name) async {
    final response = await http.get(urlRaw + '?name="$name"');
    // if (response.statusCode != 200) {
    // }
    final List parsed = json.jsonDecode(response.body)["cards"];

    final morphToCardModel = parsed
        .map((item) => MinimalCard(
              colors: item["colors"] ?? [],
              manaCost: item["manaCost"] ?? "",
              name: item["name"] ?? String,
              superTypes: item["superTypes"] ?? [],
              text: item["text"] ?? "",
              type: item["type"] ?? "",
              imageUrl: item["imageUrl"] ??
                  "", // TODO: What should be done if there is no image?
            ))
        .toList();

    respondedCards = morphToCardModel;
    print("[${DateTime.now()}] Notify listeners...");
    notifyListeners();
  }
}
