import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            NotificationCard(
              title: "New Message",
              description: "You have received a new message from John Doe.",
              time: "2 minutes ago",
              icon: Icons.message,
            ),
            NotificationCard(
              title: "Friend Request",
              description: "Alice Johnson sent you a friend request.",
              time: "10 minutes ago",
              icon: Icons.person_add,
            ),
            NotificationCard(
              title: "Event Reminder",
              description: "Don't forget about the meeting tomorrow at 10 AM.",
              time: "1 hour ago",
              icon: Icons.event,
            ),
            NotificationCard(
              title: "New Comment",
              description: "Your post has a new comment from Jane Smith.",
              time: "3 hours ago",
              icon: Icons.comment,
            ),
            NotificationCard(
              title: "Profile Update",
              description: "Your profile has been updated successfully.",
              time: "5 hours ago",
              icon: Icons.update,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final IconData icon;

  NotificationCard({super.key, 
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple[100],
          child: Icon(icon, color: Colors.deepPurple),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}