import 'package:flutter/material.dart';
import 'package:tech_adventure/bloc/user/user_bloc.dart';
import 'package:tech_adventure/data/models/place.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(_getIconDataForPlace(place)),
              const SizedBox(
                width: 20,
              ),
              Text(
                place.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Spacer(),
              Text(
                place.minigame.score.toString(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconDataForPlace(Place place) {
    switch (place.type) {
      case cafeteria:
        return Icons.restaurant;
      case office:
        return Icons.computer;
      case conferenceRoom:
        return Icons.contact_phone;
      default:
        return Icons.home;
    }
  }
}
