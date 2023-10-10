import 'package:flutter/material.dart';
import 'package:flutter_seller_fic7/utils/color_resource.dart';
import 'package:flutter_seller_fic7/utils/dimensions.dart';
import 'package:flutter_seller_fic7/utils/images.dart';

import 'widgets/on_going_order_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).highlightColor,
            title: Image.asset(Images.logoWithNameImage, height: 35),
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.paddingSizeSmall),
                OngoingOrderWidget(),

                // CompletedOrderWidget(callback: ),
                SizedBox(height: Dimensions.paddingSizeSmall),

                SizedBox(height: Dimensions.paddingSizeSmall),
              ],
            ),
          )
        ],
      ),
    );
  }
}
