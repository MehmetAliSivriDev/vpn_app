import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vpn_app/features/home/viewModel/home_view_model.dart';
import 'package:vpn_app/features/home/widget/current_connection_container.dart';
import 'package:vpn_app/features/home/widget/locations.dart';
import 'package:vpn_app/features/home/widget/top_bar_container.dart';
import 'package:vpn_app/product/util/custom_sized_box.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarContainer(),
          CustomSizedBox.getSmall025Seperator(context),
          CurrentConnectionContainer(controller: controller),
          CustomSizedBox.getSmall025Seperator(context),
          Locations(controller: controller),
        ],
      ),
    );
  }
}
