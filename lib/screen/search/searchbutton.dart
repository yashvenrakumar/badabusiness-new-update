import 'package:flutter/material.dart';

import 'search.dart';

SliverToBoxAdapter searchbuttion(BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () async {
          showSearch(context: context, delegate: CitySearch());
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: MediaQuery.of(context).size.width - 5,
            margin: EdgeInsets.all(5),
            color: Colors.blue[50],
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Center(
                        child: Text(
                      " Search your query here.....",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ))),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () async {
                      showSearch(context: context, delegate: CitySearch());

                      // final results = await
                      //     showSearch(context: context, delegate: CitySearch());

                      // print('Result: $results');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
