import 'package:flutter/material.dart';
import 'package:japomo/data/models/place.dart';
import 'package:japomo/generated/l10n.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                place.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Spacer(),
              Text(
                S.of(context).score,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                place.minigame.score.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
