import 'package:flutter/material.dart';
import 'package:magic_card_search/services/magic_api_service_provider.dart';
import 'package:magic_card_search/widgets/magic_card_content.dart';
import 'package:magic_card_search/widgets/search_bar.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Magic Card Search",
      home: ChangeNotifierProvider(
        create: (context) => MagicApiServiceProvider(),
        child: MainWidget(),
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magic Card Search"),
      ),
      body: SearchSkel(),
    );
  }
}

class SearchSkel extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: SearchBar(),
        ),
        Consumer<MagicApiServiceProvider>(builder: (ctx, cards, child) {
          return Expanded(
            flex: 12,
            child: SingleChildScrollView(
              child: Column(
                children: cards.respondedCards
                    .map((item) => MagicCardContent(item))
                    .toList(),
              ),
            ),
          );
        }),
      ],
    );
  }
}
