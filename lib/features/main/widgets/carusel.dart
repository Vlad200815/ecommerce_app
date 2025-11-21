import 'package:flutter/material.dart';

class Carusel extends StatefulWidget {
  const Carusel({super.key});

  @override
  State<Carusel> createState() => _CaruselState();
}

class _CaruselState extends State<Carusel> {
  int _selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: EdgeInsetsGeometry.only(
        top: 60,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      sliver: SliverToBoxAdapter(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 200,
              child: PageView(
                onPageChanged: changeIndex,
                children: [
                  Poster(color: Colors.blue),
                  Poster(color: Colors.amber),
                  Poster(color: Colors.pink),
                  Poster(color: Colors.purple),
                  Poster(color: Colors.black),
                  Poster(color: Colors.cyan),
                  Poster(color: Colors.deepOrange),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Dot(cardIndex: 0, currentIndex: _selectedIndex),
                  const SizedBox(width: 5),
                  Dot(cardIndex: 1, currentIndex: _selectedIndex),
                  const SizedBox(width: 5),
                  Dot(cardIndex: 2, currentIndex: _selectedIndex),
                  const SizedBox(width: 5),
                  Dot(cardIndex: 3, currentIndex: _selectedIndex),
                  const SizedBox(width: 5),
                  Dot(cardIndex: 4, currentIndex: _selectedIndex),
                  const SizedBox(width: 5),
                  Dot(cardIndex: 5, currentIndex: _selectedIndex),
                  const SizedBox(width: 5),
                  Dot(cardIndex: 6, currentIndex: _selectedIndex),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key, required this.currentIndex, required this.cardIndex});

  final int currentIndex;
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == cardIndex
            ? theme.colorScheme.primary
            : theme.colorScheme.secondary,
      ),
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
