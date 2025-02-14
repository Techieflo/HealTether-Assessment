import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heal_tether/model/UserModel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserListWidget extends StatelessWidget {
  final User user;

  const UserListWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // List of avatar images so that we can randomly assign any one of them as required or when the need arises
    final List<String> avatarImages = [
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
      "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg",
      "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg",
      "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?w=100",
      "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?w=100",
      "https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?w=100",
    ];

    // Randomly select an avatar
    final String randomAvatar =
        avatarImages[Random().nextInt(avatarImages.length)];

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300], // Placeholder background color
          child: ClipOval(
            //cachednetworkimage to make sure images avartar loads fast as possible
            child: CachedNetworkImage(
              imageUrl: randomAvatar,
              placeholder: (context, url) => const Skeletonizer(
                  child: CircularProgressIndicator()), // Show loading indicator
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error), // Handle errors
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
        ),
        title: Text(
          user.name,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        subtitle: Text(user.email),
      ),
    );
  }
}
