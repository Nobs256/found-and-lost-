// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../src/app_color.dart';
// import 'filters/filter_view.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: AppColor.defaultColor,
//             elevation: 1.0,
//             title :  Image.asset('assets/images/lost-found-banner.png',
//               height: 40,
//               width: 110,
//             ),
//             actions: [
//               IconButton(onPressed: (){Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => FilterView()),);}, icon: Icon(Icons.filter_list,size: 25.0,color: AppColor.secondaryColor,)),
//             ],
//           ),
//           // body:cubit.views.elementAt(cubit.currentIndex) ,
//           bottomNavigationBar: BottomNavigationBar(
//             onTap: (index){
            
//             },
//             selectedItemColor: AppColor.secondaryColor,
//             showSelectedLabels: true,
//             items: [
//               BottomNavigationBarItem(icon: Icon(Icons.home,color: AppColor.secondaryColor,), label: 'Home', backgroundColor: AppColor.defaultColor,),
//               BottomNavigationBarItem(icon: Icon(Icons.add_to_photos_sharp,color: AppColor.secondaryColor,),label: 'Add Post', backgroundColor: AppColor.defaultColor,),
//               BottomNavigationBarItem(icon: Icon(Icons.person_pin,color: AppColor.secondaryColor,),label: 'Profile',backgroundColor: AppColor.defaultColor,),
//               BottomNavigationBarItem(icon: Icon(Icons.chat,color: AppColor.secondaryColor,),label: 'Chats',backgroundColor: AppColor.defaultColor,),
//             ],
//           ),
//         ) ;
//   }
// }


import 'package:flutter/material.dart';
import '../../src/app_color.dart';
import 'filters/filter_view.dart';
import 'notification/notification_view.dart';
import 'posts/Posts_view.dart';
import 'posts/add_post_item.dart';
import 'profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Track the current index of the BottomNavigationBar

  // List of widgets to display based on the selected index
  final List<Widget> _screens = [
    // PostItem(userName: '', userImage: '', postTime: '', postType: '', postText: '', postImage: '',),
    PostViewScreen(),
    AddPostItem(),
    NotificationView(),
    Profile(user: UserModel(id: '', name: '', bio: '', image: '')), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.defaultColor,
        elevation: 1.0,
        title: Image.asset(
          'assets/images/lost-found-banner.png',
          height: 40,
          width: 110,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterView()),
              );
            },
            icon: Icon(
              Icons.filter_list,
              size: 25.0,
              color: AppColor.secondaryColor,
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the current index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
        },
        selectedItemColor: AppColor.secondaryColor,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColor.secondaryColor),
            label: 'Home',
            backgroundColor: AppColor.defaultColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_photos_sharp, color: AppColor.secondaryColor),
            label: 'Add Post',
            backgroundColor: AppColor.defaultColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: AppColor.secondaryColor),
            label: 'Chats',
            backgroundColor: AppColor.defaultColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin, color: AppColor.secondaryColor),
            label: 'Profile',
            backgroundColor: AppColor.defaultColor,
          ),
        ],
      ),
    );
  }
}
