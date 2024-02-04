import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopx/view_model/controller/home_screen_controller/home_screen_controller.dart';

import '../../../res/colors/app_colors.dart';

class ProductGridShowWidget extends StatelessWidget {
  ProductGridShowWidget({super.key, required this.controller});

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    /*250 is for notification bar on Android*/
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height ) / 2.5;
    // final double itemHeight = (size.height) / 2.5;
    final double itemWidth = size.width / 2;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisCount: size.width > 600 ? 3 : 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Card(
                    color: Colors.white,
                    elevation: 0.8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Stack(
                      children: [
                        // Product Image:
                        Positioned(
                            right: 5,
                            left: 5,
                            top: 5,
                            child: Image.network(
                              controller.productList[index].image.toString(),
                              height: 150
                            )),

                        //Contents
                        Positioned(
                          top: 160,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Product Title:
                                  SizedBox(
                                    width: itemWidth/1.5,
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
                                ]),
                          ),
                        ),

                        //Add to favourite list:
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

                        //Add to shopping cart:
                        Positioned(
                          top: 230,
                          right: 0.5,
                          child: IconButton(
                              onPressed: () {},
                              iconSize: 22,
                              style: IconButton.styleFrom(),
                              icon: const Icon(
                                Icons.shopping_cart,
                              )),
                        )
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
