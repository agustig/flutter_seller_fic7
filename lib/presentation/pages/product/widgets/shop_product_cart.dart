import 'package:flutter/material.dart';
import 'package:flutter_seller_fic7/utils/color_resource.dart';
import 'package:flutter_seller_fic7/utils/custom_themes.dart';
import 'package:flutter_seller_fic7/utils/dimensions.dart';

import 'custom_image.dart';

class ShopProductCart extends StatelessWidget {
  ShopProductCart({super.key});

  final renderOverlay = true;
  final visible = true;
  final switchLabelPosition = false;
  final extend = false;
  final mini = false;
  final customDialRoot = false;
  final closeManually = false;
  final useRAnimation = true;
  final isDialOpen = ValueNotifier<bool>(false);

  final buttonSize = const Size(35.0, 35.0);
  final childrenButtonSize = const Size(45.0, 45.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeMedium,
                vertical: Dimensions.paddingSizeSmall,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(.05),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Dimensions.paddingSizeSmall,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.10),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.paddingSizeSmall,
                                ),
                              ),
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.paddingSizeSmall,
                                ),
                                child: const CustomImage(image: ''),
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.paddingSizeExtraSmall,
                            ),
                            Text(
                              'Product type',
                              style: robotoRegular.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: Dimensions.paddingSizeSmall,
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 0,
                                  left: 30,
                                ),
                                child: Text(
                                  'Product Name',
                                  style: robotoRegular.copyWith(
                                      color:
                                          ColorResources.titleColor(context)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: Dimensions.paddingSizeSmall,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSizeSmall,
                                  vertical: Dimensions.paddingSizeExtraSmall,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.paddingSizeExtraSmall,
                                  ),
                                  color: ColorResources.getRed(context),
                                ),
                                child: Text(
                                  'New',
                                  style: robotoRegular.copyWith(
                                      color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: Dimensions.paddingSizeSmall,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Selling price : ',
                                        style: robotoRegular.copyWith(
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      Text(
                                        'Rp 3.000.000',
                                        style: robotoMedium.copyWith(
                                          color: ColorResources.titleColor(
                                              context),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
        const SizedBox()
      ],
    );
  }
}
