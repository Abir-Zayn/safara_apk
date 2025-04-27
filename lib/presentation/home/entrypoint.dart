import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:safara_apk/presentation/home/home_page.dart';
import 'package:safara_apk/presentation/home/profile_page.dart';
import 'package:safara_apk/presentation/home/search_page.dart';
import 'package:safara_apk/presentation/home/wishlist_page.dart';

class Entrypoint extends StatefulWidget {
  const Entrypoint({super.key});

  @override
  State<Entrypoint> createState() => _EntrypointState();
}

class _EntrypointState extends State<Entrypoint> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              0,
              Icons.home_outlined,
              Icons.home,
            ),
            _buildNavItem(
              1,
              Icons.search_outlined,
              Icons.search,
            ),
            _buildNavItem(
              2,
              Icons.favorite_outline,
              Icons.favorite,
            ),
            _buildNavItem(
              3,
              Icons.person_outline,
              Icons.person,
            ),
          ],
        ),
      ),

      // The body of the app will be the selected page based on the index
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            HomePage(),
            SearchPage(),
            WishlistPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData iconOutlined, IconData iconFilled) {
    final isSelected = _currentIndex == index;

    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.yellow.shade700.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: isSelected ? 30.h : 26.h,
              width: isSelected ? 30.w : 26.w,
              child: Icon(
                isSelected ? iconFilled : iconOutlined,
                color: isSelected ? Colors.yellow.shade700 : Colors.grey,
                size: isSelected ? 30.sp : 22.sp,
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}
