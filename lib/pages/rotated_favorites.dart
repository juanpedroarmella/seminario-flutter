import 'package:flutter/material.dart';
import 'package:namer_app/pages/favorites.dart';

class RotatedFavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: RotatedBox(
      quarterTurns: 3,
      child: FavoritesPage(),
    ));
  }
}
