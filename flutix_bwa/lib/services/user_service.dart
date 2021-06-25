part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(Users user) async {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilPicture': user.profilPicture ?? ""
    });
  }

  static Future<Users> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();
    return Users(
      id,
      snapshot.data['email'],
      balance: snapshot.data['balance'],
      profilPicture: snapshot.data['profilPicture'],
      selectedGenres: (snapshot.data['selectedGenres'] as List)
          .map((e) => e.toString())
          .toList(),
      selectedLanguage: snapshot.data['selectedLanguage'],
      name: snapshot.data['name'],
    );
  }
}
