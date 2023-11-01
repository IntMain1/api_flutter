import 'dart:io';
import 'package:api_flutter/constants/cashed_data.dart';
import 'package:api_flutter/screens/home.dart';
import 'package:api_flutter/screens/profile.dart';
import 'package:api_flutter/widgets/slider_view.dart';
import '../widgets/news_item_view.dart';
import '../constants/constants.dart';
import '../widgets/categories_items_view.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 7,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: CachedData().getName(),
                          builder: (context, snapshot) => Text(
                            'Hello, ${snapshot.data}',
                            style: TextStyle(
                                color: AppStyle.white_t,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const Text(
                          "Have a nice day",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: CachedData().getImage(),
                    builder: (context, snapshot) => CircleAvatar(
                      radius: 30,
                      backgroundColor: AppStyle.white_t,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfileView(),
                          ));
                        },
                        child: CircleAvatar(
                            radius: 25,
                            backgroundImage: (snapshot.data != null)
                                ? FileImage(
                                    File(snapshot.data.toString()),
                                  ) as ImageProvider
                                : const AssetImage(
                                    'lib/assets/images/avatar.png')),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SliderView(),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 50,
                child: CategoriesItems(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    NewsItem(category: 'general'),
                    NewsItem(category: 'science'),
                    NewsItem(category: 'sports'),
                    NewsItem(category: 'business'),
                    NewsItem(category: 'entertainment'),
                    NewsItem(category: 'technology'),
                    NewsItem(category: 'health'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
