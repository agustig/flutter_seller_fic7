import 'package:flutter/material.dart';
import 'package:flutter_seller_fic7/utils/custom_themes.dart';
import 'package:flutter_seller_fic7/utils/dimensions.dart';
import 'package:flutter_seller_fic7/utils/images.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String prefix;
  final Function iconPressed;
  final Function? onSubmit;
  final Function? onChanged;
  final Function? filterAction;
  final bool isFilter;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hint,
    required this.prefix,
    required this.iconPressed,
    this.onSubmit,
    this.onChanged,
    this.filterAction,
    this.isFilter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: robotoRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: Theme.of(context).disabledColor.withOpacity(.5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  Dimensions.paddingSizeSmall,
                ),
              ),
              filled: true,
              fillColor: Theme.of(context).primaryColor.withOpacity(.07),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: .70,
                ),
                borderRadius:
                    BorderRadius.circular(Dimensions.paddingSizeSmall),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
                child: SizedBox(
                  width: Dimensions.iconSizeExtraSmall,
                  child: Image.asset(prefix),
                ),
              ),

              // IconButton(
              //   onPressed: iconPressed,
              //   icon: Icon(prefix, color: Theme.of(context).hintColor),
              // ),
            ),
            onSubmitted: onSubmit as void Function(String)?,
            onChanged: onChanged as void Function(String)?,
          ),
        ),
        isFilter
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: Dimensions.paddingSizeExtraSmall,
                ),
                child: GestureDetector(
                  onTap: filterAction as void Function()?,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(
                        Dimensions.paddingSizeExtraSmall,
                      ),
                    ),
                    padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
                    child: Image.asset(Images.filterIcon,
                        width: Dimensions.paddingSizeLarge),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
