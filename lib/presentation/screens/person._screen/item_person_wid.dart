
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/apptextstyles.dart';
import '../../../feature/domain/entity/rickandmorty_entity.dart';
import '../detail_screen.dart/detail_screen.dart';

class ItemPerson extends StatelessWidget {
  const ItemPerson({super.key, required this.items});
  final Results items;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPerson(
              id: items.id ?? 0,
            ),
          ),
        );
      },
      child: Container(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: items.image ?? '',
                height: 74,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  items.status == 'Alive'
                      ? Text(
                          items.status ?? '',
                          style:const TextStyle(color: Colors.green),
                        )
                      : items.status == 'Dead'
                          ? Text(
                              items.status ?? '',
                              style:const TextStyle(color: Colors.red),
                            )
                          : Text(
                              items.status ?? '',
                              style:const TextStyle(color: Colors.grey),
                            ),
                  Text(
                    items.name?? '',overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    items.gender ?? '',
                    style: ApptextStyles.roboto12w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
