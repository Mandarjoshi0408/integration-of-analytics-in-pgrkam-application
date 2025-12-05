import 'dart:async';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCorousalSection extends ConsumerStatefulWidget {
  const HomeCorousalSection({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeCorousalSectionState();
}

class _HomeCorousalSectionState extends ConsumerState<HomeCorousalSection> {
  late final PageController _pageController;
  int selectedIndex = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          if (selectedIndex == 2 - 1) {
            selectedIndex = 0;
          } else {
            selectedIndex++;
          }
          _pageController.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 230,
                width: size.width,
                child: PageView.builder(
                  controller: _pageController,
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/a3.jpg',
                              height: 180,
                              width: MediaQuery.sizeOf(context).width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
