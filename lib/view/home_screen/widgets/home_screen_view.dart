import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/view/home_screen/widgets/product_grid_show_widget.dart';
import 'package:shopx/view/home_screen/widgets/product_list_show_widget.dart';
import 'package:shopx/view_model/controller/home_screen_controller/home_screen_controller.dart';

import '../../../data/response/status.dart';
import '../../../res/colors/app_colors.dart';

class HomeScreenView extends StatelessWidget {
  HomeScreenView({super.key});

  HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Heading section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8, left: 10),
                child: Text(
                  "ShopX",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: IconButton(
                        onPressed: () {
                          controller.isListView.value = true;
                        },
                        icon: const Icon(
                          Icons.list,
                          color: AppColors.black,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: IconButton(
                        onPressed: () {
                          controller.isListView.value = false;
                        },
                        icon: const Icon(Icons.grid_view,
                            color: AppColors.black)),
                  )
                ],
              )
            ],
          ),

          Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.LOADING:
                return const CircularProgressIndicator(
                  color: AppColors.black,
                );
              case Status.FAILED:
                return const Center(child: Text("ERROR! ⚠"));
              case Status.COMPLETED:
                return Obx(() => controller.isListView.value
                    ? ProductListShowWidget(controller: controller)
                    : ProductGridShowWidget(controller: controller));
            }
          })
        ],
      ),
    );
  }
}
