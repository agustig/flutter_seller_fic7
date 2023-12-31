import 'package:flutter/material.dart';
import 'package:flutter_seller_fic7/presentation/pages/base_widgets/custom_app_bar.dart';
import 'package:flutter_seller_fic7/presentation/pages/base_widgets/text_field/custom_text_field.dart';
import 'package:flutter_seller_fic7/utils/color_resource.dart';
import 'package:flutter_seller_fic7/utils/custom_themes.dart';
import 'package:flutter_seller_fic7/utils/dimensions.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Product'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeDefault,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Row(
              children: [
                Text(
                  'Product Name',
                  style: robotoRegular.copyWith(
                      color: ColorResources.titleColor(context),
                      fontSize: Dimensions.fontSizeDefault),
                ),
                Text(
                  '*',
                  style: robotoBold.copyWith(
                    color: ColorResources.mainCardFourColor(context),
                    fontSize: Dimensions.fontSizeDefault,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            CustomTextField(
              textInputAction: TextInputAction.next,
              controller: TextEditingController(),
              textInputType: TextInputType.name,
              hintText: 'Product title',
              border: true,
              onChanged: (String text) {},
            ),
            const SizedBox(
              height: Dimensions.paddingSizeExtraLarge,
            ),
            Row(
              children: [
                Text(
                  'Description',
                  style: robotoRegular.copyWith(
                    color: ColorResources.titleColor(context),
                    fontSize: Dimensions.fontSizeDefault,
                  ),
                ),
                Text(
                  '*',
                  style: robotoBold.copyWith(
                    color: ColorResources.mainCardFourColor(context),
                    fontSize: Dimensions.fontSizeDefault,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            CustomTextField(
              isDescription: true,
              controller: TextEditingController(),
              onChanged: (String text) {},
              textInputType: TextInputType.multiline,
              maxLine: 3,
              border: true,
              hintText: 'Enter description',
            ),
            const SizedBox(
              height: Dimensions.paddingSizeExtraLarge,
            ),
            Row(
              children: [
                Text('Select Category',
                    style: robotoRegular.copyWith(
                        color: ColorResources.titleColor(context),
                        fontSize: Dimensions.fontSizeDefault)),
                Text(
                  '*',
                  style: robotoBold.copyWith(
                      color: ColorResources.mainCardFourColor(context),
                      fontSize: Dimensions.fontSizeDefault),
                ),
              ],
            ),
            const SizedBox(
              height: Dimensions.paddingSizeExtraSmall,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius:
                    BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                border: Border.all(
                    width: .5,
                    color: Theme.of(context).hintColor.withOpacity(.7)),
              ),
              child: DropdownButton<int>(
                value: 1,
                items: [1, 2, 3, 4].map((int? val) {
                  return DropdownMenuItem<int>(
                    value: val,
                    child: const Text('1'),
                  );
                }).toList(),
                onChanged: (int? value) {},
                isExpanded: true,
                underline: const SizedBox(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius:
                BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
          ),
          child: const Center(
              child: Text(
            'Continue',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeLarge),
          )),
        ),
      ),
    );
  }
}
