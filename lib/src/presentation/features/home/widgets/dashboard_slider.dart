import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/routing_config.dart';
import '../../../../domain/entity/search_entity.dart';
import '../../../common/widgets/poster.dart';

class DashboardSlider extends StatefulWidget {
  const DashboardSlider({super.key, required this.items});

  final List<SearchEntity> items;

  @override
  State<DashboardSlider> createState() => _DashboardSliderState();
}

class _DashboardSliderState extends State<DashboardSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index, _) {
        return AnimatedScale(
          duration: const Duration(milliseconds: 300),
          scale: _currentIndex == index ? 1.0 : 0.8, // Dynamic scaling
          child: InkWell(
            onTap: () async {
              await RoutingConfig.of(context).goToDetails(widget.items.elementAt(index).imdbID ?? "");
            },
            child: Poster(
              posterUrl: widget.items.elementAt(index).poster ?? "",
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.6,
        autoPlay: true,
        enlargeCenterPage: true, // Center item is enlarged
        viewportFraction: 0.6, // Fraction of the viewport occupied by an item
        enableInfiniteScroll: true, // Loop carousel
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
