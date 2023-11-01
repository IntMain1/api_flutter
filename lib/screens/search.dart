import 'package:api_flutter/widgets/search_list_view.dart';
import '../constants/constants.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String queryData = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: TextStyle(color: AppStyle.white_t),
              cursorColor: AppStyle.lime_t,
              onChanged: (value) {
                setState(() {
                  queryData = value;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppStyle.lime_t,
                  ),
                  filled: true,
                  fillColor: AppStyle.container_b,
                  hintText: 'Search for news like science, sports, etc..',
                  hintStyle: TextStyle(color: AppStyle.white_t, fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppStyle.container_b)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppStyle.container_b)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppStyle.container_b))),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: SearchListView(query: queryData)),
          ],
        ),
      )),
    );
  }
}
