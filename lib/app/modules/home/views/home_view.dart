import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: GetBuilder<HomeController>(
            builder: (_) => Stack(
              children: [
                controller.currentWeather == null
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextField(
                                        controller: controller.searchController,
                                        decoration: const InputDecoration(
                                          hintText: 'Search...',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () => controller
                                          .search(),
                                      child: const Text("Done"))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.03,
                              ),
                              child: Align(
                                child: Text(
                                  controller.currentWeather?.location.name ??
                                      "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.height * 0.06,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.03,
                              ),
                              child: Align(
                                child: Text(
                                  controller.currentWeather?.location.region ??
                                      "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.height * 0.03,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.03,
                              ),
                              child: Align(
                                child: Text(
                                  '${controller.currentWeather?.current.feelslikeC}˚C',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: size.height * 0.10,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.25),
                              child: const Divider(
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.005,
                              ),
                              child: Align(
                                child: Text(
                                  controller.currentWeather?.current.condition
                                          .text ??
                                      "",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: size.height * 0.03,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            InkWell(
                              onTap: () => controller.gotoDetails(),
                              child: Center(
                                child: Container(
                                  width: size.width * 0.40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 10
                                    ),
                                    child: Align(
                                      child: Text(
                                        "Details",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.height * 0.02,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
