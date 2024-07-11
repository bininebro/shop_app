import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeeeeee),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'LOGO Inc.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '회사 소개 ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8, // Height of the vertical divider
                  child: VerticalDivider(
                    thickness: .8,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '인재 채용',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8, // Height of the vertical divider
                  child: VerticalDivider(
                    thickness: .8,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '기술 블로그',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8, // Height of the vertical divider
                  child: VerticalDivider(
                    thickness: .8,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '리뷰 저작권',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/img.png'),
                    const Text(
                      'review@logo.com',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
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
                        value: 'KOR',
                        items: const [
                          DropdownMenuItem(
                            value: 'KOR',
                            child: Text(
                              'KOR',
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
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            const SizedBox(height: 20),
            const Text(
              '@2022-2022 LOGO Lab, Inc. (주)아무개  서울시 강남구',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
