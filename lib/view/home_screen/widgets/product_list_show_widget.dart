import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../res/colors/app_colors.dart';
import '../../../view_model/controller/home_screen_controller/home_screen_controller.dart';

class ProductListShowWidget extends StatelessWidget {
  ProductListShowWidget({super.key, required this.controller});

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Container(
          child: ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                final product = controller.productList[index];
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 150.00,
                    child: Card(
                      elevation: 0.5,
                      child: Stack(children: [
                        //image section
                        Positioned(
                          left: 5,
                          top: 5,
                          bottom: 5,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.1)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 5, bottom: 5),
                                  child: Image.network(
                                    product.image.toString(),
                                    height: 150.0,
                                    width: 100,
                                  ),
                                ),
                              ),

                              //details section
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Product Title:
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        controller.productList[index].title
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),

                                    const Gap(5),

                                    //Product Price:
                                    Text(
                                      "Price: \$${controller.productList[index].price.toString()}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    const Gap(5),

                                    //Product Category:
                                    Text(
                                        "Type: ${controller.productList[index].category.toString()}"),

                                    const Gap(5),

                                    //Product Rating Stars:
                                    AnimatedRatingStars(
                                        starSize: 12.0,
                                        readOnly: true,
                                        filledColor: Colors.amber,
                                        emptyColor: Colors.grey,
                                        interactiveTooltips: true,
                                        initialRating: 4.5,
                                        onChanged: (double rating) {},
                                        customFilledIcon: Icons.star,
                                        customHalfFilledIcon: Icons.star_half,
                                        customEmptyIcon: Icons.star_border),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Obx(() => Positioned(
                          right: 0.5,
                          top: 1,
                          child: IconButton(
                              iconSize: 22,
                              onPressed: () {
                                if (controller.favouriteList.contains(
                                    controller.productList[index].id)) {
                                  controller.removeFromFav(
                                      controller.productList[index].id);
                                } else {
                                  controller.addToFav(
                                      controller.productList[index].id);
                                }
                              },
                              icon: controller.favouriteList.contains(
                                  controller.productList[index].id)
                                  ? const Icon(
                                Icons.favorite,
                                color: AppColors.red,
                              )
                                  : const Icon(Icons.favorite_border)),
                        )),

                        Positioned(
                          bottom: 1,
                          right: 0.5,
                          child: IconButton(
                              onPressed: () {},
                              iconSize: 22,
                              style: IconButton.styleFrom(),
                              icon: const Icon(
                                Icons.shopping_cart,
                              )),
                        )
                      ]),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
