import 'package:api_flutter/constants/constants.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      physics: BouncingScrollPhysics(),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      backgroundColor: AppStyle.lime_t,
      unselectedBackgroundColor: AppStyle.container_b,
      unselectedLabelStyle: const TextStyle(color: Colors.white),
      labelStyle:
          TextStyle(color: AppStyle.container_b, fontWeight: FontWeight.bold),
      tabs: const [
        Tab(
          text: "General",
        ),
        Tab(
          text: "Science",
        ),
        Tab(
          text: "Sports",
        ),
        Tab(
          text: "Business",
        ),
        Tab(
          text: "Entertainment",
        ),
        Tab(
          text: "Technology",
        ),
        Tab(
          text: "Health",
        ),
      ],
    );
  }
}
