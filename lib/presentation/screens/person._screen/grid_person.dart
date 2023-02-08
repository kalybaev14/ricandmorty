import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/apptextstyles.dart';
import '../../../feature/domain/entity/rickandmorty_entity.dart';
import '../detail_screen.dart/detail_screen.dart';

class GridPerson extends StatelessWidget {
  const GridPerson({super.key, required this.res});
  final Results res;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPerson(
              id: res.id ?? 0,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: res.image ?? '',
                height: 122,
                width: 120,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child:
                      CircularProgressIndicator(value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            res.status == 'Alive'
                ? Text(res.status ?? '',
                    style: const TextStyle(color: Colors.green))
                : res.status == 'Dead'
                    ? Text(res.status ?? '',
                        style: const TextStyle(color: Colors.red))
                    : Text(res.status ?? '',
                        style: const TextStyle(color: Colors.grey)),
            Text(
              res.name ?? '',
              overflow: TextOverflow.ellipsis,
              style: ApptextStyles.roboto14w500,
            ),
            Text(
              '${res.species ?? ''} ${res.gender ?? ''} ',
              overflow: TextOverflow.ellipsis,
              style: ApptextStyles.roboto12w400,
            ),
          ],
        ),
      ),
    );
  }
}
