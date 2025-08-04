
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/models/classplase.dart';

class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.5,
            width: double.infinity,
            child: Image.network(
              place.urls.first,
              fit: BoxFit.cover,
            ),
          ),

          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    place.placeType,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  if (place.description != null)
                    Text(
                      place.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                  const Spacer(),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/bottom_navigation_w/Icon/Share.svg',
                            height: 28,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Поделиться",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(width: 40),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/bottom_navigation_w/Icon/Heart.svg',
                            height: 28,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "В избранное",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

