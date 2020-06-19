import 'package:flutter/material.dart';
import 'package:magic_card_search/models/minimal_card.dart';

class MagicCardContent extends StatefulWidget {
  _MagicCardContentState createState() => _MagicCardContentState();

  final MinimalCard minimalCardList;
  MagicCardContent(this.minimalCardList);
}

class _MagicCardContentState extends State<MagicCardContent> {
  bool _onTap = false;
  Widget expanding(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  List<Widget> _showMore() {
    return [
      ListTile(
        leading: Text("Card Text:"),
        title: Text(widget.minimalCardList.text),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.network(
                  widget.minimalCardList.imageUrl,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 311.0,
                      height: 223.0,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Column(
                children: [
                  ListTile(
                    leading: Text("Name:"),
                    title: Text(widget.minimalCardList.name),
                  ),
                  ListTile(
                    leading: Text("Mana cost:"),
                    title: Text(widget.minimalCardList.manaCost),
                  ),
                  ListTile(
                    leading: Text("Type:"),
                    title: Text(widget.minimalCardList.type),
                  ),
                  if (_onTap) ..._showMore(),
                  GestureDetector(
                    onTap: () => setState(() => _onTap = !_onTap),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(15.0),
                      child: _onTap
                          ? expanding("Less...", Icons.arrow_drop_up)
                          : expanding("More...", Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
