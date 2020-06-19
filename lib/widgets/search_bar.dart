import 'package:flutter/material.dart';
import 'package:magic_card_search/services/magic_api_service_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  void _tapSearchButton(BuildContext context) {
    if (_searchController.text.isNotEmpty) {
      print(
          "[${DateTime.now()}][Cardname: ${_searchController.text}] Fetching data from API...");
      Provider.of<MagicApiServiceProvider>(context, listen: false)
          .getCardByName(_searchController.text);
      return;
    }
    print("[${DateTime.now()}] Stopped tapping on null");
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
              controller: _searchController,
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _tapSearchButton(context),
          ),
        ],
      ),
    );
  }
}
