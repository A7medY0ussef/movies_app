
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class AvatarCarousel extends StatefulWidget {
  final ValueChanged<String>? onAvatarSelected;

  const AvatarCarousel({
    super.key,
    this.onAvatarSelected,
  });

  @override
  State<AvatarCarousel> createState() => _AvatarCarouselState();
}

class _AvatarCarouselState extends State<AvatarCarousel> {
  int selectedIndex = 1;

  final List<String> avatars = [
    Assets.avatar1Icon,
    Assets.avatar2Icon,
    Assets.avatar3Icon,
    Assets.avatar4Icon,
    Assets.avatar5Icon,
    Assets.avatar6Icon,
    Assets.avatar7Icon,
    Assets.avatar8Icon,
    Assets.avatar9Icon,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onAvatarSelected?.call(avatars[selectedIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            itemCount: avatars.length,
            itemBuilder: (context, index, realIndex) {
              final isSelected = selectedIndex == index;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: Image.asset(
                  avatars[index],
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              );
            },
            options: CarouselOptions(
              height: 120,
              viewportFraction: 0.38,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              initialPage: selectedIndex,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  selectedIndex = index;
                });

                widget.onAvatarSelected?.call(avatars[index]);
              },
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Avatar',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
