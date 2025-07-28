import 'package:flutter/material.dart';
import 'package:tourism_app/screen/bookmark/bookmark_screen.dart';
import 'package:tourism_app/screen/home/home_screen.dart';
import '../../provider/main/index_nav_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
 const MainScreen({super.key});

  // int _indexBottomNavBar = 0;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
    body: Consumer<IndexNavProvider>(
      builder: (context, value, child) {
        return switch (value.indexBottomNavBar) {
          0 => const HomeScreen(),
          _ => const BookmarkScreen(),
        };
      }
    ),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
        onTap: (index) {
          context.read<IndexNavProvider>().setIndextBottomNavBar = index;
        },
       items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
            tooltip: 'Bookmarks',
          ),
       ],
     ),
   );
 }
}