import 'package:api_flutter/constants/constants.dart';
import 'package:api_flutter/services/api_service.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().fetchNews(category: category),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.articles;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppStyle.container_b,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyle.container_b,
                          offset: Offset(0, 3),
                          blurRadius: 36,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        width: 150,
                        height: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            data[index].urlToImage ?? '',
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                "https://th.bing.com/th/id/R.be755c5f6034a8456e3e0a3b53501be9?rik=BFByVMYHFRvNkw&riu=http%3a%2f%2fwww.tuxfordonline.co.uk%2fassets%2fimages%2ftemplates%2ficons%2fnews-icon-lg.png&ehk=7t64ID6WZ3vNzcNq290r1pluWdrwKaCV1kZjcPvPjOY%3d&risl=&pid=ImgRaw&r=0",
                              );
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        width: 200,
                        height: double.infinity,
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                constraints: BoxConstraints(
                                  maxWidth: 160,
                                ),
                                child: Text(
                                  data[index].title ?? '',
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                    color: AppStyle.white_t,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 0, 96, 0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                      width: 10,
                                      height: 6,
                                      child: Icon(
                                        Icons.menu,
                                        color: AppStyle.white_t,
                                        size: 10,
                                      ),
                                    ),
                                    Text(
                                      // readdVR (502:26)
                                      'READ',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600,
                                        height: 2,
                                        letterSpacing: 0.3,
                                        color: AppStyle.white_t,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppStyle.lime_t,
              ),
            );
          }
        });
  }
}
