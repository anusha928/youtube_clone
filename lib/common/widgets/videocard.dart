import 'package:flutter/material.dart';

import 'package:sunday/common/utils/colors.dart';


class VideoCard extends StatelessWidget {
  //final Video video;
  final String imageurl;
  final String title;
  final void Function() onPressed;

  const VideoCard({
    super.key,
    required this.imageurl,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  imageurl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 8.0,
                  right: 8,
                  child: Container(
                    color: AppColors.mainblackColor,
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "8.00",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.only(top: 6, bottom: 14),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => print("Navigate to profile"),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      fit: BoxFit.cover,
                      height: 30,
                      width: 30,
                      image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg",
                      ),
                    )),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: AppColors.mainblackColor,
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            child: const Expanded(child: Text("MR.DUCK"))),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
