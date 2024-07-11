import 'package:flutter/material.dart';

import '../models/cat.dart';

class DetailPage extends StatelessWidget {
  final Cat item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Center(
          child: Column(
            children: [
              Text(
                '랭킹 1위',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Text(
                '베스트 리뷰어',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
        leading: IconButton(
          iconSize: 30.0,
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Hero(
              tag: item.name,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(item.image),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              item.name,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/cr.png'),
                const Text(
                  '골드',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0, color: Color.fromRGBO(255, 210, 51, 1)),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              padding: const EdgeInsets.all(10),
              child: const Text(
                '조립컴 업체를 운영하며 리뷰를 작성합니다.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              height: 20.0,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('작성한 리뷰'),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Container(
                      height: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: '최신순',
                          items: const [
                            DropdownMenuItem(
                              value: '최신순',
                              child: Text(
                                '최신순',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                          onChanged: (String? newValue) {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: .2,
              thickness: .8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 124,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset(
                              'assets/images/img_2.png',
                              width: 120,
                              height: 100,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AMD 라이젠 5 5600X 버미어\n정품 멀티팩',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        SizedBox(height: 4.0),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromRGBO(255, 210, 51, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromRGBO(255, 210, 51, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromRGBO(255, 210, 51, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromRGBO(255, 210, 51, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.black12,
                            ),
                            Text(
                              '4.07',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        // Wrap(
                        //   spacing: 6.0,
                        //   children: item.tags
                        //       .map((tag) => Chip(
                        //           padding: const EdgeInsets.all(0),
                        //           side: BorderSide.none,
                        //           backgroundColor:
                        //               const Color.fromRGBO(240, 240, 240, 1),
                        //           label: Text(
                        //             tag,
                        //             style: const TextStyle(
                        //                 fontWeight: FontWeight.w200),
                        //           )))
                        //       .toList(),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(item.image),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w200),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color.fromRGBO(255, 210, 51, 1),
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color.fromRGBO(255, 210, 51, 1),
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color.fromRGBO(255, 210, 51, 1),
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color.fromRGBO(255, 210, 51, 1),
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.black12,
                              ),
                              Text(
                                '2022.12.09',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.bookmark_outline, color: Colors.grey),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '“가격 저렴해요”',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '“CPU온도 고온”',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '“서멀작업 가능해요”',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '“게임 잘”',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.power_settings_new_outlined,
                        color: Colors.purple,
                      ),
                      Text(
                          '멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객\n님들에게도 추천 가능한 제품인 듯 합니다.'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.power_settings_new_outlined,
                        color: Colors.grey,
                      ),
                      Container(
                          child: Text(
                              '3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느\n낌 까지는 아닙니다.')),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/img_4.png',
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(width: 16.0),
                  Image.asset(
                    'assets/images/img_5.png',
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(width: 16.0),
                  Image.asset(
                    'assets/images/img_6.png',
                    width: 70,
                    height: 70,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.sms_outlined,
                  ),
                  SizedBox(width: 6.0),
                  Text('댓글 달기..'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
