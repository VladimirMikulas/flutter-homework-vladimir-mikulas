import 'package:flutter/material.dart';

class CharacterDetailItem extends StatelessWidget {
  CharacterDetailItem({required this.label, required this.data, Key? key})
      : super(key: key);

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Flexible(
              child: Text(
                data,
                style: const TextStyle(
                  overflow: TextOverflow.fade,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        )
      ],
    ));
  }
}
