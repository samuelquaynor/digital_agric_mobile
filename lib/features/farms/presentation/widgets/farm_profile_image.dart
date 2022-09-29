import 'package:flutter/material.dart';

// import '../../../../core/data/images.dart';

/// Settings page UI
class FarmProfileImage extends StatelessWidget {
  /// Constructor
  const FarmProfileImage(
      {super.key, required this.avatarUrl, required this.onChange});

  /// User avatar url path
  final String avatarUrl;

  /// Callback function to change avatar url
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: onChange,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            width: 80,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Container(
                            height: 80,
                            width: 80,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                            child: const Icon(Icons.add,
                                color: Colors.white, size: 25)),
                    placeholder: const AssetImage(
                        'assets/images/logo-white-transparentbg.png'),
                    image: NetworkImage(avatarUrl)))),
      ),
      Padding(
          padding: const EdgeInsets.only(left: 60, top: 50),
          child: GestureDetector(
              onTap: onChange,
              child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ))))
    ]);
  }
}
