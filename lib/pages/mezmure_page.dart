import 'package:auto_size_text/auto_size_text.dart';
import 'package:baseleal/models/mezmures_model.dart';
import 'package:flutter/material.dart';

class MezmurePage extends StatelessWidget {
  final Mezmure _mezmure;
  const MezmurePage({
    required mezmure,
    super.key,
  }) : _mezmure = mezmure;

  // estimating the number of lines in a string
  int estimateLineCount(String text) {
    return text.split('\\n').length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 72,
            toolbarHeight: 70,
            pinned: true,
            elevation: 10,
            shadowColor: Theme.of(context).colorScheme.secondaryFixedDim,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
                iconColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.tertiary),
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onTertiary,
                ),
              ),
            ),
            title: Text(
              _mezmure.name,
              style: TextStyle(
                fontFamily: 'Sadiss',
                fontSize: 23,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.04,
                    ),
                    child: AutoSizeText(
                      _mezmure.mezmure.replaceAll('\\n', '\n'),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontFamily: 'Lessan',
                      ),
                      maxLines: estimateLineCount(
                        _mezmure.mezmure,
                      ),
                      maxFontSize: 25,
                      minFontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
