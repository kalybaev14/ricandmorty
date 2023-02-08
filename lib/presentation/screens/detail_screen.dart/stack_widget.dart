import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/domain/entity/detail_entity.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key, required this.person});
  final DetailResponse person;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                child: Image.network(
                  person.image ?? '',
                  scale: 3.2,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(color: Colors.black.withOpacity(0)),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 137,
            child: Container(
              height: 145,
              width: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                border: Border.all(
                  width: 8,
                  color:const Color(0xff0B1E2D),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: CachedNetworkImage(
                  imageUrl: person.image ?? '',
                  height: 74,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
