import 'package:flutter/material.dart';
import 'package:h2s/models/feed_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FeedTemplate extends StatelessWidget {
  final FeedModel feedModel;

  const FeedTemplate({Key? key, required this.feedModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          _launchURL(feedModel.url.toString());
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(feedModel.img.toString()),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width - 36,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feedModel.headline.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        feedModel.date.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await canLaunchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
