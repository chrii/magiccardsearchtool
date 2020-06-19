import "package:flutter/material.dart";

class MinimalCard {
  final String name;
  final String manaCost;
  final List colors;
  final String type;
  final List superTypes;
  final String text;
  final String imageUrl;

  MinimalCard({
    @required this.colors,
    @required this.manaCost,
    @required this.name,
    @required this.superTypes,
    @required this.text,
    @required this.type,
    @required this.imageUrl,
  });
}
