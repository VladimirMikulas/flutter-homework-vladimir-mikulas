import 'package:flutter/material.dart';

class EpisodeDetailItem extends StatelessWidget {
  EpisodeDetailItem(
      {required this.episodeNumber,
      required this.name,
      required this.releaseDate,
      Key? key})
      : super(key: key);

  final String episodeNumber;
  final String name;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            episodeNumber,
            textAlign: TextAlign.center,
            style: const TextStyle(
              overflow: TextOverflow.fade,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              overflow: TextOverflow.fade,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            releaseDate,
            style: const TextStyle(
              overflow: TextOverflow.fade,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
