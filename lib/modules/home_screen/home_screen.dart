import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas05/configs/app_routes.dart';
import 'package:tugas05/models/user.dart';

import 'home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Size size;

  tapBottomItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: HeaderWidget(
                user: widget.user,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SearchFieldWidget(),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SectionTitle(
                    label: "Hotest News",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).goNamed(
                        AppRoutes.newsDetailHot,
                      );
                    },
                    child: HotestNewsCard(
                      size: size,
                      newsTitle:
                          "GO AWAY!",
                      pictureUrl:
                          "data:image/png;base64,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",
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SectionTitle(
                    label: "Latest News",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: LatestNewsIndexCardSection(
                    size: size,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: tapBottomItem,
        items: [
          bottomMenuItem(
            "Home",
            Icons.home_rounded,
          ),
          bottomMenuItem(
            "News",
            Icons.newspaper_rounded,
          ),
          bottomMenuItem(
            "Menu",
            Icons.menu_rounded,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomMenuItem(
    String label,
    IconData iconData,
  ) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        iconData,
      ),
    );
  }
}
