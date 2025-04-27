import 'package:baseleal/elements/skeleton.dart';
import 'package:baseleal/models/gallery_model.dart';
import 'package:baseleal/pages/album_page.dart';
import 'package:baseleal/themes/theme_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryTile extends StatelessWidget {
  final Gallery _gallery;

  const GalleryTile({
    required gallery,
    super.key,
  }) : _gallery = gallery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlbumPage(
            album: _gallery,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, left: 16, right: 16),
        child: Container(
          width: double.maxFinite,
          height: 110,
          decoration: BoxDecoration(
            color:
                Provider.of<ThemeProvider>(context, listen: false).isLightmode
                    ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.2)
                    : const Color.fromRGBO(255, 255, 255, 0.21),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 5,
                color: Theme.of(context).colorScheme.secondaryFixedDim,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: _gallery.imageUrls.first,
                    errorWidget: (context, url, error) => const Skelton(
                      width: 134,
                      height: 110,
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      width: 134,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Skelton(
                      width: 134,
                      height: 110,
                    ),
                    placeholderFadeInDuration: const Duration(seconds: 1),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _gallery.folderName,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontFamily: 'poppins',
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${_gallery.folderSize} photos',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.65),
                          fontFamily: 'poppins',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              //
              ,
              //
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Tab to see',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
