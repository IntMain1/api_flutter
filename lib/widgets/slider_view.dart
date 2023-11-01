import 'package:api_flutter/constants/constants.dart';
import 'package:api_flutter/services/api_service.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: FutureBuilder(
        future: ApiService().fetchImages(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.articles;
            return CarouselSlider(
              items: [
                for (var i = 0; i < data.length; i++)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "${data[i].urlToImage}",
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://th.bing.com/th/id/R.be755c5f6034a8456e3e0a3b53501be9?rik=BFByVMYHFRvNkw&riu=http%3a%2f%2fwww.tuxfordonline.co.uk%2fassets%2fimages%2ftemplates%2ficons%2fnews-icon-lg.png&ehk=7t64ID6WZ3vNzcNq290r1pluWdrwKaCV1kZjcPvPjOY%3d&risl=&pid=ImgRaw&r=0",
                        );
                      },
                      fit: BoxFit.cover,
                      scale: 1.5,
                    ),
                  ),
              ],
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(milliseconds: 500),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                scrollDirection: Axis.horizontal,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppStyle.lime_t,
              ),
            );
          }
        },
      ),
    );
  }
}
