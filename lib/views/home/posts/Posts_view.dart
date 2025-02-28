import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostViewScreen extends StatelessWidget {
  const PostViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'userName': 'John Doe',
        'userImage': 'assets/images/profile.png',
        'postTime': DateTime.now().subtract(Duration(hours: 2)),
        'postType': 'found',
        'postText': 'I found my wallet my wallet!',
        'postImage': 'assets/images/post.jpeg',
        'likesCount': 120,
      },
      {
        'userName': 'John Doe',
        'userImage': 'assets/images/profile2.png',
        'postTime': DateTime.now().subtract(Duration(hours: 2)),
        'postType': 'lost',
        'postText': 'I lost my wallet!',
        'postImage': 'assets/images/post.jpeg',
        'likesCount': 120,
      },
      {
        'userName': 'John Doe',
        'userImage': 'assets/images/profile.png',
        'postTime': DateTime.now().subtract(Duration(hours: 2)),
        'postType': 'lost',
        'postText': 'I lost my wallet!',
        'postImage': 'assets/images/post.jpeg',
        'likesCount': 120,
      },
      // Add more posts...
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(
            userName: post['userName'],
            userImage: post['userImage'],
            postTime: post['postTime'],
            postType: post['postType'],
            postText: post['postText'],
            postImage: post['postImage'],
            likesCount: post['likesCount'],
          );
        },
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final String userName;
  final String userImage;
  final DateTime postTime;
  final String postType;
  final String postText;
  final String postImage;
  final int likesCount;

  PostCard({
    required this.userName,
    required this.userImage,
    required this.postTime,
    required this.postType,
    required this.postText,
    required this.postImage,
    required this.likesCount,
  });

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  int currentLikes = 0;

  @override
  void initState() {
    super.initState();
    currentLikes = widget.likesCount;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.userImage),
                  radius: 20,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        timeago.format(widget.postTime),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Post Image (Smaller Size)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: 180, // Reduced image height
              width: double.infinity,
              child: Image.asset(
                widget.postImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Interaction Icons and Status
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey.shade700,
                        size: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                          currentLikes += isLiked ? 1 : -1;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.grey.shade700,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: widget.postType == 'lost'
                        // ignore: deprecated_member_use
                        ? Colors.red.withOpacity(0.1)
                        // ignore: deprecated_member_use
                        : Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: widget.postType == 'lost'
                          // ignore: deprecated_member_use
                          ? Colors.red.withOpacity(0.3)
                          // ignore: deprecated_member_use
                          : Colors.green.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    widget.postType.toUpperCase(),
                    style: TextStyle(
                      color: widget.postType == 'lost'
                          ? Colors.red
                          : Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Text Content
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 12), // Fixed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$currentLikes likes',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.postText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}