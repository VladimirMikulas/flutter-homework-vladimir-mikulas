import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/widgets/app_back_button.dart';
import 'package:flutter_homework/presentation/widgets/item.dart';

class CharactersRoute extends StatelessWidget {
  const CharactersRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: AppBackButton(), title: Text('Rick and Morty characters')),
        body: SafeArea(
            child: Column(
          children: [
            for (final _ in [0, 1, 2])
              Padding(
                  padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                  child: Item()),
          ],
        )));
  }
}
