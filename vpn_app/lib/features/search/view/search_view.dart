import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vpn_app/features/home/viewModel/home_view_model.dart';
import 'package:vpn_app/features/search/widget/locations_for_search.dart';
import 'package:vpn_app/product/constant/product_box_decoration.dart';
import 'package:vpn_app/product/constant/product_input_decoration.dart';
import 'package:vpn_app/product/constant/product_padding.dart';
import 'package:vpn_app/product/util/custom_sized_box.dart';

class SearchView extends GetView<HomeViewModel> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: ProductPadding.allMedium(),
      child: Column(
        children: [
          CustomSizedBox.getSmall025Seperator(context),
          _buildSearchBar(),
          CustomSizedBox.getSmall015Seperator(context),
          LocationsForSearch(controller: controller),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: ProductBoxDecoration.homeContainerDecoration(),
      child: TextField(
        controller: controller.searchController,
        onChanged: (value) {
          controller.search(value);
        },
        decoration: ProductInputDecoration.searchIDecoration(),
        autofocus: true,
      ),
    );
  }
}
