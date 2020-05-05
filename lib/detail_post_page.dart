import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;

  DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시물'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(document['userPhotoUrl']),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: <Widget>[
                            Text(document['displayName'],
                                style: TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      PopupMenuButton(
                        onSelected: popupMenuSelected,
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                          const PopupMenuItem( child: const Text("child 0"), value: "Value 0",),
                          const PopupMenuItem( child: const Text("child 1"), value: "Value 1",),
                          const PopupMenuItem( child: const Text("child 2"), value: "Value 2",),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(document['url'], fit: BoxFit.fill)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.heart),
                      SizedBox(width: 16.0),
                      Icon(FontAwesomeIcons.comment),
                      SizedBox(width: 16.0),
                      Icon(FontAwesomeIcons.paperPlane),
                    ],
                  ),
                  Icon(FontAwesomeIcons.bookmark)
                ],
              )
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Text(document['displayName'],
                      style: TextStyle(fontWeight: FontWeight.bold))
                ),
                Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(document['contents'])
                ),
              ],
            )
          ],
        )
      ),
    );
  }

  void popupMenuSelected(String value) {
  }
}
