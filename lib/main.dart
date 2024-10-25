import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _pageIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          tabContainer(context, 'home page'),
          tabContainer(context, 'make page'),
          tabContainer(context, 'profile page'),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: CupertinoColors.transparent,
          highlightColor: CupertinoColors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: CupertinoColors.white,
          currentIndex: _pageIndex,
          onTap: (index) {
            setState(() {
              _pageIndex = index;
              _tabController.index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _pageIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: _pageIndex == 1
                  ? const Icon(Icons.add_circle)
                  : const Icon(Icons.add_circle_outline),
              label: 'make',
            ),
            BottomNavigationBarItem(
              icon: _pageIndex == 2
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline),
              label: 'profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CupertinoColors.black,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 16),
        ),
      )
    );
  }

  Widget tabContainer(BuildContext context, String tabText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Header(
                title: tabText,
              ),
              Center(
                child: Text(
                  tabText,
                  style: const TextStyle(color: CupertinoColors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
