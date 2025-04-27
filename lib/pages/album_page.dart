import 'package:baseleal/elements/skeleton.dart';
import 'package:baseleal/models/gallery_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class AlbumPage extends StatefulWidget {
  final Gallery album;
  const AlbumPage({required this.album, super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 72,
        toolbarHeight: 70,
        shadowColor: Theme.of(context).colorScheme.secondaryFixedDim,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
            iconColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.tertiary),
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onTertiary),
          ),
        ),
        title: Text(
          widget.album.folderName,
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 19,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: MasonryGridView.builder(
              itemCount: widget.album.imageUrls.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: InstaImageViewer(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.album.imageUrls[index],
                      placeholder: (context, url) => const Skelton(
                        width: 100,
                        height: 100,
                        borderRadius: 4,
                      ),
                      errorWidget: (context, url, error) => const Skelton(
                        height: 150,
                        width: 200,
                        borderRadius: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ), // D,
    );
  }
}
