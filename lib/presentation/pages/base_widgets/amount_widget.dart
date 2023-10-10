import 'package:flutter/material.dart';
import 'package:flutter_seller_fic7/utils/custom_themes.dart';
import 'package:flutter_seller_fic7/utils/dimensions.dart';

class AmountWidget extends StatelessWidget {
  final String? title;
  final String amount;

  const AmountWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeExtraSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: titilliumRegular.copyWith(
              fontSize: Dimensions.fontSizeDefault,
            ),
          ),
          Text(
            amount,
            style: titilliumRegular.copyWith(
              fontSize: Dimensions.fontSizeDefault,
            ),
          ),
        ],
      ),
    );
  }
}
