import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulerning_app/pages/application/homepage_widgets/homepage_widgets.dart';
import 'package:ulerning_app/pages/settings/settings_page.dart';

import '../../routes/names.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profilePageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            profile(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: myCoursesOnProfile(Icons.book, "My courses"),
                  onTap: () {
                    print("Xxxxxxxxxxxxxxx");
                    // Navigator.of(context).pushNamed(RouteNames.SETTINGS_PAGE);
                  },
                ),
                GestureDetector(
                  child: myCoursesOnProfile(Icons.book, "My courses"),
                  onTap: () {
                    print("Xxxxxxxxxxxxxxx");
                    // Navigator.of(context).pushNamed(RouteNames.SETTINGS_PAGE);
                  },
                ),
                GestureDetector(
                  child: myCoursesOnProfile(Icons.book, "My courses"),
                  onTap: () {
                    print("Xxxxxxxxxxxxxxx");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                ),
                // myCoursesOnProfile(Icons.settings, "Settings"),
                // myCoursesOnProfile(Icons.article, "Articles"),
              ],
            ),
            _listOfProfilePageSettings(context),
          ],
        ),
      ),
    );
  }
}

Widget _listOfProfilePageSettings(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        child: listTileItem("Settings", Icons.settings),
        onTap: () {
          print("Xxxxxxxxxxxxxxx");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));

          // Navigator.of(context).pushNamed(RouteNames.SETTINGS_PAGE);
        },
      ),
      GestureDetector(
        child: listTileItem("Payment Details", Icons.credit_card),
        onTap: () {
          print("Second button was tappppppppppped");
          Navigator.of(context).pushNamed(RouteNames.REGISTER_PAGE);
        },
      ),
      listTileItem("Achievements", Icons.card_giftcard),
      listTileItem("Love", Icons.heart_broken_rounded),
      listTileItem("Reminders", Icons.wifi_tethering_outlined),
    ],
  );
}

Widget listTileItem(String listTile, IconData icon) {
  return Container(
    padding: EdgeInsets.only(left: 12.w, top: 15.h),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.h),
              ),
              color: Colors.blue),
          padding: EdgeInsets.all(8),
          child: Icon(
            icon,
            color: Colors.white,
            size: 25.sp,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        customSubtitle(listTile,
            color: Colors.black, font_Size: 18, fontWeight: FontWeight.bold)
      ],
    ),
  );
}

AppBar profilePageAppBar() {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        size: 25.sp,
      ),
      onPressed: () {},
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            size: 25.sp,
          ))
    ],
    centerTitle: true,
    title: Text(
      "Profile",
    ),
  );
}

Widget profile() {
  return Stack(children: [
    Container(
      child: Center(
        child: CircleAvatar(
          radius: 50.h,
          child: FlutterLogo(),
        ),
      ),
    ),
  ]);
}

Widget myCoursesOnProfile(
  IconData icon,
  String name,
) {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100.w,
        padding: EdgeInsets.all(8),
        // height: 100.h,
        // width: 150.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.h),
            ),
            color: Colors.blue),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                // size: 35.sp,
                color: Colors.white,
              ),
              SizedBox(
                height: 5.h,
              ),
              customSubtitle(name, color: Colors.white, font_Size: 15)
            ],
          ),
        ),
      ),
    ),
  );
}
