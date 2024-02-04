import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopx/view_model/controller/bottom_navigation_controller/bottom_navigation_controller.dart';
import 'package:shopx/view_model/controller/home_screen_controller/home_screen_controller.dart';
import 'package:shopx/view_model/controller/user_preferences_controller/user_preferences_controller.dart';

import '../../res/app_urls/app_urls.dart';
import '../../res/colors/app_colors.dart';
import '../../res/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeScreenController());
  final userPreference = UserPreferences();
  final navigationController = Get.put(BottomNavigationController());

  @override
  void initState() {
    super.initState();
    controller.getUserInformation();
    controller.getProductListAPI();
  }

  @override
  Widget build(BuildContext context) {
    num itemHeight = MediaQuery.sizeOf(context).height;
    num itemWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      // appbar section
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  CupertinoIcons.list_bullet_indent,
                  color: Colors.black,
                ));
          },
        ),
      ),

      drawer: Drawer(
          backgroundColor: AppColors.offWhite,
          child: Stack(
            children: [
              //BLACK heading space
              Container(
                color: Colors.black.withOpacity(0.85),
                height: itemHeight * 0.30,
              ),

              //white background box
              Positioned(
                top: itemHeight * 0.18,
                right: itemWidth * 0.02,
                left: itemWidth * 0.02,
                child: Container(
                  width: itemWidth.toDouble(),
                  height: itemHeight * 0.28,
                  child: Card(
                    color: Colors.white,
                    elevation: 0.8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),

              //profile picture
              Positioned(
                  top: itemHeight * 0.12,
                  left: itemWidth * 0.19,
                  right: itemWidth * 0.19,
                  child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: AppColors.white, width: 2)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        AppUrls.profilePictureURL,
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))),

              //content below profile picture in white background box
              Positioned(
                top: itemHeight * 0.32,
                left: itemWidth * 0.01,
                right: itemWidth * 0.01,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        controller.userInfoList.value.name!.firstname
                            .toString()
                            .toUpperCase(),
                        style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email),
                        const Gap(5),
                        Obx(
                          () => Text(
                            controller.userInfoList.value.email.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.phone),
                        const Gap(5),
                        Obx(
                          () => Text(
                              controller.userInfoList.value.phone.toString()),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Home Option
              Positioned(
                right: itemWidth * 0.02,
                left: itemWidth * 0.02,
                top: itemHeight * 0.47,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: Container(
                    width: double.infinity,
                    height: itemHeight * 0.08,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Gap(15),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Gap(15),
                          Text(
                            "home".tr,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Notification Option
              Positioned(
                right: itemWidth * 0.02,
                left: itemWidth * 0.02,
                top: itemHeight * 0.55,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: Container(
                    width: double.infinity,
                    height: itemHeight * 0.08,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Gap(15),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Gap(15),
                          Text(
                            "notification".tr,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Favourites option
              Positioned(
                right: itemWidth * 0.02,
                left: itemWidth * 0.02,
                top: itemHeight * 0.63,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(RoutesName.favouriteScreen);
                  },
                  splashColor: Colors.black26,
                  child: Container(
                    width: double.infinity,
                    height: itemHeight * 0.08,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Gap(15),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                          Gap(15),
                          Text(
                            "favourites".tr,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Cart Option
              Positioned(
                right: itemWidth * 0.02,
                left: itemWidth * 0.02,
                top: itemHeight * 0.71,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: Container(
                    width: double.infinity,
                    height: itemHeight * 0.08,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Gap(15),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Gap(15),
                          Text(
                            "cart".tr,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Settings Option
              Positioned(
                right: itemWidth * 0.02,
                left: itemWidth * 0.02,
                top: itemHeight * 0.79,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: Container(
                    width: double.infinity,
                    height: itemHeight * 0.08,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Gap(15),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Gap(15),
                          Text(
                            "settings".tr,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Logout Option
              Positioned(
                right: itemWidth * 0.02,
                left: itemWidth * 0.02,
                top: itemHeight * 0.87,
                child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        backgroundColor: Colors.white,
                        title: "recheck_msg".tr,
                        titlePadding: EdgeInsets.only(top: 20),
                        content: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("recheck_logout_content".tr),
                            )
                          ],
                        ),
                        confirm: TextButton(
                            onPressed: () {
                              controller.logout();
                            },
                            child: Text(
                              "confirm".tr,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                        cancel: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("cancel".tr,
                                style: TextStyle(
                                  color: Colors.black,
                                ))));

                    controller.logout();
                  },
                  splashColor: Colors.black26,
                  child: Container(
                    width: double.infinity,
                    height: itemHeight * 0.08,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Gap(15),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.logout_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Gap(15),
                          Text(
                            "logout".tr,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),

   // body section

      body: Obx(() => Center(
          child: navigationController
              .pages[navigationController.currentIndex.value])),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            currentIndex: navigationController.currentIndex.value,
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Favourites', icon: Icon(Icons.favorite_border)),
              BottomNavigationBarItem(
                  label: 'Cart', icon: Icon(Icons.shopping_cart_outlined)),
              BottomNavigationBarItem(
                  label: 'Settings', icon: Icon(Icons.settings_outlined)),
            ],
            onTap: (int newIndex) {
              navigationController.currentIndex.value = newIndex;
            },
          )),
    );
  }
}
