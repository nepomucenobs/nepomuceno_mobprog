import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

// The newsfeed: a list of two posts.
// TODO: Post 1 is YOUR post. Replace 'Your Name' with your own name
// and write your own post text.
// TODO: Post 2 is by a CLASSMATE you pick. Replace "Classmate's Name"
// with their name and write their post text.

class Post {
  Post({
    required this.authorName,
    required this.date,
    required this.text,
    required this.likes,
    this.imageAsset,
    this.avatarAsset,
    this.isLiked = false,
  });

  final String authorName;
  final String date;
  final String text;
  int likes;
  final String? imageAsset;
  final String? avatarAsset;
  bool isLiked;
}

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final List<Post> _posts = [
    Post(
      authorName: 'Bryannica Nepomuceno',
      date: 'November 23',
      text: 'ang ganda ko!',
      likes: 100,
      imageAsset: null,
      avatarAsset: 'assets/images/avatar_image.png',
    ),
    Post(
      authorName: "Roseann Vista",
      date: 'November 23',
      text: 'Ang ganda ni Bry',
      likes: 200,
      // TODO: Add an image file named post_image.png to assets/images/,
      // or change this path to your own image. If the file is missing,
      // the card shows a grey placeholder instead of crashing.
      imageAsset: 'assets/images/post_image.jpg',
    ),
  ];

  void _likePost(int index) {
    setState(() {
      final post = _posts[index];
      post.isLiked = !post.isLiked;
      post.likes += post.isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          authorName: post.authorName,
          date: post.date,
          text: post.text,
          likes: post.likes,
          imageAsset: post.imageAsset,
          avatarAsset: post.avatarAsset,
          isLiked: post.isLiked,
          onLike: () => _likePost(index),
        );
      },
    );
  }
}
