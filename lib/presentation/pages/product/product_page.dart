import 'package:flutter/material.dart';
import 'package:flutter_seller_fic7/presentation/pages/base_widgets/custom_app_bar.dart';
import 'package:flutter_seller_fic7/presentation/pages/product/widgets/all_product_widget.dart';
import 'package:flutter_seller_fic7/presentation/pages/product/widgets/custom_search_field.dart';
import 'package:flutter_seller_fic7/utils/dimensions.dart';
import 'package:flutter_seller_fic7/utils/images.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Product List'),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Container(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Dimensions.paddingSizeDefault,
                  Dimensions.paddingSizeDefault,
                  Dimensions.paddingSizeDefault,
                  Dimensions.paddingSizeDefault,
                ),
                child: CustomSearchField(
                  controller: searchController,
                  hint: 'Search',
                  prefix: Images.iconsSearch,
                  iconPressed: () => () {},
                  onSubmit: (text) => () {},
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          const Expanded(child: AllProductWidget())
        ],
      ),
    );
  }
}
