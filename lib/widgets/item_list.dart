import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/item.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late Future<List<Item>> items;

  Future<List<Item>> loadItems() async {
    final String response =
        await rootBundle.loadString('assets/data/items.json');
    final data = json.decode(response) as List;
    return data.map((json) => Item.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    items = loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '제일 핫한 리뷰를 만나보세요',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    '리뷰️  랭킹⭐ top 3',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
        FutureBuilder<List<Item>>(
          future: items,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Item> items =
                  snapshot.data!.take(3).toList(); // Get top 3 items
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 104,
                          height: 124,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  item.rank,
                                  width: 19,
                                  height: 15,
                                  fit: BoxFit.fitWidth,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Image.asset(
                                    item.image,
                                    width: 78,
                                    height: 76,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: item.subtitles.map((subtitle) {
                                    return Row(
                                      children: [
                                        Container(
                                          width: 5.0,
                                          height: 5.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 4.0),
                                        Expanded(
                                          child: Text(
                                            subtitle,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Color.fromRGBO(255, 210, 51, 1),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    item.rating.toString(),
                                    style: const TextStyle(
                                        color: Color.fromRGBO(255, 210, 51, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text('(${item.ratingCount})'),
                                ],
                              ),
                              Wrap(
                                spacing: 6.0,
                                children: item.tags
                                    .map((tag) => Chip(
                                        padding: const EdgeInsets.all(0),
                                        side: BorderSide.none,
                                        backgroundColor: const Color.fromRGBO(
                                            240, 240, 240, 1),
                                        label: Text(
                                          tag,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w200),
                                        )))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
