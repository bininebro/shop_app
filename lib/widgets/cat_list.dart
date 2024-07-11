import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/cat.dart';
import '../pages/detail_page.dart';

class CatList extends StatefulWidget {
  const CatList({super.key});

  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  late Future<List<Cat>> items;

  Future<List<Cat>> loadItems() async {
    final String response =
        await rootBundle.loadString('assets/data/cats.json');
    final data = json.decode(response) as List;
    return data.map((json) => Cat.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    items = loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '골드 계급 사용자들이예요',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
              ),
              Text(
                '베스트 리뷰어 🏆 Top10',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: FutureBuilder<List<Cat>>(
              future: items,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Cat> items = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      Cat item = items[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(item: item),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 106,
                                child: Hero(
                                  tag: item.name,
                                  child: index == 0
                                      ? SizedBox(
                                          height: 90,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/cr.png',
                                                width: 19,
                                                height: 15,
                                                fit: BoxFit.fitWidth,
                                              ),
                                              CircleAvatar(
                                                radius: 45,
                                                backgroundColor:
                                                    const Color(0xffFDCF09),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage:
                                                      AssetImage(item.image),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Center(
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundImage:
                                                AssetImage(item.image),
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(item.name),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
