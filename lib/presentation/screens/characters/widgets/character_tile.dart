import 'package:flutter/material.dart';
import 'package:flutter_homework/data/api/models/rick_and_morty_character_model.dart';
import 'package:flutter_homework/domain/models/character_item_ui_model.dart';

class CharacterTile extends StatelessWidget {
  CharacterTile({required this.character, Key? key}) : super(key: key);

  final CharacterItemUiModel character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: (character.status == Status.Alive)
                ? Colors.green.shade200
                : (character.status == Status.Dead)
                    ? Colors.red.shade200
                    : Colors.grey.shade200),
        child: Material(
          type: MaterialType.transparency,
          child: ListTile(
              leading: Hero(
                tag: character.name,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(character.image),
                ),
              ),
              trailing: Icon((character.gender == Gender.Male)
                  ? Icons.male
                  : (character.gender == Gender.Female)
                      ? Icons.female
                      : Icons.block),
              title: Text(character.name),
              subtitle: Text(character.lastLocationName),
              onTap: () {
                /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetailsPage(
                    countryDetails: character,
                  ),
                ),
              );*/
              }),
        ),
      ),
    );
  }
}
