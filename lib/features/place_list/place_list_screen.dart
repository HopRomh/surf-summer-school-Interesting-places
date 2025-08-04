import 'package:flutter/material.dart';
import '../../../data/models/classplase.dart';
import '../../../data/services/readejson.dart';
import 'place_card.dart';

class PlaceListScreen extends StatefulWidget {
  const PlaceListScreen({super.key});

  @override
  State<PlaceListScreen> createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  late Future<List<Place>> futurePlaces;

  @override
  void initState() {
    super.initState();
    futurePlaces = MockPlaceService().fetchPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Place>>(
      future: futurePlaces,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Ошибка загрузки данных', style: TextStyle(color: Colors.white)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Нет мест', style: TextStyle(color: Colors.white)));
        }

        final places = snapshot.data!;

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xFF21222C),
              foregroundColor: Colors.white,
              title: const Text('Список интересных мест'),
              centerTitle: true,
              floating: true,
              snap: true,
              pinned: false,
              elevation: 0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => PlaceCard(place: places[index]),
                childCount: places.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        );
      },
    );
  }
}
