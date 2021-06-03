import 'package:cloud_firestore/cloud_firestore.dart';

class NewsItem {
  postNewsItem(String headline, String content) async {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    var now = (ms ~/ 1000);

    FirebaseFirestore.instance.collection('news').add({
      'headline': headline,
      'content': content,
      'dateAdded': now,
    }).then((value) {
      print(value.id);
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((documentSnapshot) {
          documentSnapshot.reference.collection('newsFeed').add({
            'headline': headline,
            'content': content,
            'dateAdded': now,
          });
          // documentSnapshot.reference.update({
          //   'newsFeed': FieldValue.arrayUnion([newsItemID])
          // });
        });
      });
    });
  }
}
