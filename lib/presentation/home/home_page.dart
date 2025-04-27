import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safara_apk/common/widgets/appstyle.dart';
import 'package:safara_apk/common/widgets/apptext.dart';
import 'package:safara_apk/common/widgets/apptextfield.dart';
import 'package:safara_apk/data/model/tab/destination_tab.dart';
import 'package:safara_apk/presentation/home/widgets/categories.dart';
import 'package:safara_apk/presentation/others/all_page.dart';
import 'package:safara_apk/presentation/others/mostviewed_page.dart';
import 'package:safara_apk/presentation/others/popular_page.dart';
import 'package:safara_apk/presentation/others/recommendartion_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: profileSection(),
        actions: [
          homeAppBtn(),
        ],
        toolbarHeight: 80.h,
        titleSpacing: 16.w,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 15.h),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              //Search Bar
              Apptextfield(
                hintText: 'Search for your next adventure',
                hintStyle: appStyle(
                    size: 15.sp,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400),
                leadingIcon: Icon(FontAwesomeIcons.search,
                    color: Colors.yellow.shade700),
                onChanged: (value) {
                  // Handle search input change
                },
              ),
              SizedBox(
                height: 20.h,
              ),

              //Destination Tiles
              destinationTiles(context),
              SizedBox(
                height: 20.h,
              ),

              //Popular Destinations
              Align(
                alignment: Alignment.centerLeft,
                child: AppTextstyle(
                  text: 'Explore Cities',
                  style: appStyle(
                      size: 25.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              //Tab Bar
              _tabs(),
              SizedBox(
                height: 210.h,
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    AllPage(
                      key: ValueKey('All'),
                    ),
                    PopularPage(
                      key: ValueKey('Popular'),
                    ),
                    RecommendartionPage(
                      key: ValueKey('Recommendations'),
                    ),
                    MostviewedPage(
                      key: ValueKey('Most Viewed'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // Popular Destinations

              Align(
                alignment: Alignment.centerLeft,
                child: AppTextstyle(
                  text: 'Popular Categories',
                  style: appStyle(
                      size: 25.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryItem(
                      icon: FontAwesomeIcons.bus,
                      label: "Transport",
                      onTap: () {},
                      size: 80,
                    ),
                    SizedBox(width: 10.w),
                    CategoryItem(
                      icon: FontAwesomeIcons.locationPin,
                      label: "Guides",
                      onTap: () {},
                      size: 80,
                    ),
                    SizedBox(width: 10.w),
                    CategoryItem(
                      icon: FontAwesomeIcons.hotel,
                      label: "Hotels",
                      onTap: () {},
                      size: 80,
                    ),
                    SizedBox(width: 10.w),
                    CategoryItem(
                      icon: FontAwesomeIcons.calendar,
                      label: "Events",
                      onTap: () {},
                      size: 80,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabs() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        controller: _tabController,
        isScrollable: true,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black.withOpacity(0.6),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        tabs: [
          _tabItem("All", 0),
          _tabItem("Popular", 1),
          _tabItem("Recommendations", 2),
          _tabItem("Most Viewed", 3),
        ],
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.yellow.shade700,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String text, int index) {
    Color textcolor = Colors.black;
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: AppTextstyle(
          text: text,
          style: appStyle(
            size: 14.sp,
            color:
                _currentIndex == index ? textcolor : textcolor.withOpacity(0.5),
            fontWeight:
                _currentIndex == index ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

Widget profileSection() {
  return Container(
    child: Row(
      children: [
        // Profile Picture
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1985&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
        ),
        SizedBox(width: 10.w),
        // User Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextstyle(
              text: 'Welcome Back',
              style: appStyle(
                  size: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            AppTextstyle(
              text: 'John Doe',
              style: appStyle(
                  size: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget homeAppBtn() {
  return Row(
    children: [
      Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(FontAwesomeIcons.telegram),
          onPressed: () {
            // Handle search button press
          },
        ),
      ),
      SizedBox(width: 10.w),
      Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(FontAwesomeIcons.bell),
          onPressed: () {
            // Handle search button press
          },
        ),
      ),
      SizedBox(width: 10.w),
    ],
  );
}

Widget destinationTiles(BuildContext context) {
  return SizedBox(
    height: 70.h,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        itemBuilder: (context, index) {
          final destination = destinations[index];
          return GestureDetector(
            onTap: () {
              // Handle destination tap
            },
            child: Container(
              height: 50.h,
              width: 110.w,
              decoration: BoxDecoration(
                color: Colors.yellow.shade700,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundImage: NetworkImage(destination['image']),
                    ),
                    SizedBox(width: 10.w),
                    AppTextstyle(
                      text: destination['title'],
                      style: appStyle(
                        size: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
