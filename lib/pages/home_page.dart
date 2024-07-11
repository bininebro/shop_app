import 'package:flutter/material.dart';

import '../widgets/cat_list.dart';
import '../widgets/footer.dart';
import '../widgets/gradient_search_bar.dart';
import '../widgets/image_carousel.dart';
import '../widgets/item_list.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {}

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 23,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: GradientSearchBar(
                controller: _searchController,
                hintText: '검색어를 입력하세요',
              ),
            ),

            ImageCarousel(),
            const SizedBox(height: 20),
            ItemList(), // Add ItemList widget here
            Container(
              height: 20.0,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 20),
            const CatList(),

            const SizedBox(height: 20),
            const Footer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/b1.png',
              width: 35,
              height: 35,
              fit: BoxFit.fitHeight,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/b2.png',
              width: 35,
              height: 35,
              fit: BoxFit.fitHeight,
            ),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/b3.png',
              width: 35,
              height: 35,
              fit: BoxFit.fitHeight,
            ),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/b4.png',
              width: 35,
              height: 35,
              fit: BoxFit.fitHeight,
            ),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey.shade700,
        unselectedItemColor: Colors.grey.shade500,
        onTap: _onItemTapped,
      ),
    );
  }
}
