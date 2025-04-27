import 'package:baseleal/elements/connection_checker.dart';
import 'package:baseleal/elements/skeleton.dart';
import 'package:baseleal/api_calls/fetching_carousel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class IfConGallery extends StatefulWidget {
  final void Function(int) navigateTo;
  const IfConGallery({required this.navigateTo, super.key});
  @override
  State<IfConGallery> createState() => _IfConGalleryState();
}

class _IfConGalleryState extends State<IfConGallery> {
  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);
    final Future<List>? imageList;

    networkStatus == NetworkStatus.online
        ? imageList = getImageUrls()
        : imageList = fetchingImageUrlFromBox();
    return FutureBuilder(
      future: imageList,
      builder: (context, futureImage) {
        if (futureImage.hasData && futureImage.data!.isNotEmpty) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Our collections',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontFamily: 'poppins',
                        fontSize: 17,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => widget.navigateTo(1),
                      child: Text(
                        'See All',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      color: Theme.of(context).colorScheme.secondaryFixedDim,
                      offset: const Offset(0, 20),
                      spreadRadius: -30,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: FlutterCarousel(
                  items: futureImage.data!
                      .map(
                        (url) => CachedNetworkImage(
                          imageUrl: url,
                          placeholder: (context, url) => const Skelton(
                            borderRadius: 20,
                          ),
                          errorWidget: (context, url, error) => const Skelton(),
                          imageBuilder: (context, imageProvider) => Container(
                            height: 220,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    aspectRatio: 1.3,
                    viewportFraction: 0.7,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 700,
                    ),
                    autoPlayInterval: const Duration(
                      seconds: 5,
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                    slideIndicator: CircularWaveSlideIndicator(
                      slideIndicatorOptions: SlideIndicatorOptions(
                        indicatorBackgroundColor: const Color(0xffB0AEAE),
                        currentIndicatorColor:
                            Theme.of(context).colorScheme.secondary,
                        indicatorRadius: 8,
                        itemSpacing: 20,
                        padding: const EdgeInsets.all(4),
                      ),
                    ),
                    floatingIndicator: false,
                  ),
                ),
              ),
            ],
          );
        } else if (futureImage.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skelton(
                      width: 200,
                      height: 24,
                    ),
                    Skelton(
                      width: 100,
                      height: 24,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Skelton(
                width: 300,
                height: MediaQuery.of(context).size.height * 0.3,
              )
            ],
          );
        } else if (futureImage.hasError) {
          return SizedBox(
            width: 300,
            height: 220,
            child: Center(
              child: Text(
                'CHECK YOUR CONNECTION',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontFamily: 'poppins',
                  fontSize: 12,
                ),
              ),
            ),
          );
        } else {
          return const SizedBox(
            height: 0,
          );
        }
      },
    );
  }
}
