import 'package:app/core/constants/assets.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:app/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

int _currentIndex = 0;

class EntryPoint extends ConsumerWidget {
  const EntryPoint({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> pages = [Routes.groups, Routes.chats, Routes.people];
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chats'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: context.colorScheme.background,
              radius: 20,
              backgroundImage: AssetImage(Assets.assetsImagesUserLogo),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          context.push(pages[index]);
          _currentIndex = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.language), label: 'People'),
        ],
      ),
      body: child,
    );
  }
}

// import 'package:app/core/constants/assets.dart';
// import 'package:app/core/utils/extentions.dart';
// import 'package:app/pages/home/home_page.dart';
// import 'package:app/pages/people/people_page.dart';
// import 'package:app/routes/app_router.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// import 'pages/chats/chats_page.dart';

// class EntryPoint extends ConsumerWidget {
//   EntryPoint({super.key, required this.child});
//   final Widget child;

//   final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
//   final PageController _pageController = PageController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final pages = [Routes.home, Routes.chats, Routes.people];
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Chats'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundColor: context.colorScheme.background,
//               radius: 20,
//               backgroundImage: AssetImage(Assets.assetsImagesUserLogo),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: ValueListenableBuilder<int>(
//         valueListenable: _currentPage,
//         builder: (context, value, child) {
//           return BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: value,
//             selectedItemColor: context.colorScheme.primary,
//             unselectedItemColor: context.colorScheme.onBackground,
//             showUnselectedLabels: true,
//             showSelectedLabels: true,
//             selectedLabelStyle: context.textTheme.bodyMedium,
//             unselectedLabelStyle: context.textTheme.bodySmall,
//             iconSize: 20,
//             selectedFontSize: 12,
//             unselectedFontSize: 12,
//             onTap:
//                 (index) => _pageController.animateToPage(
//                   index,
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.ease,
//                 ),
//             items: const [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//               BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.people),
//                 label: 'People',
//               ),
//             ],
//           );
//         },
//       ),
//       body: ValueListenableBuilder<int>(
//         valueListenable: _currentPage,
//         builder: (context, value, child) {
//           return PageView(
//             controller: _pageController,
//             onPageChanged: (index) => _currentPage.value = index,
//             children: const [HomePage(), ChatsPage(), PeoplePage()],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           context.push(Routes.chats);
//           _pageController.animateToPage(
//             1,
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.ease,
//           );
//         },
//       ),
//     );
//   }
// }
