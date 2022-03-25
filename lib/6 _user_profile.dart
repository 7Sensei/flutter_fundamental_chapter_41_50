import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String name;
  final String role;
  final String photoUrl;

  /// * Name berisi *nama user*. Nilai defaultnya adalah `No Name`
  ///
  /// * Role berisi *role user*. Nilai defalunya adalah `No Role`
  ///
  /// * PhotoURL berisi link **photo user**. Nilainya defaulnya adalah `null`
  ///
  /// Contoh :
  ///
  /// ~~~
  /// name: Tony Stack,
  /// role: Midlanner,
  /// photoUrl: https://lalala.png,
  /// ;
  /// ~~~
  UserProfile({this.name = 'No Name', this.role = 'No Role', this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage(
            (photoUrl != null)
                ? photoUrl
                : 'https://gravatar.com/avatar/f33c768ea4c84ac3662a4e2646362f14?s=400&d=robohash&r=x',
          ),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        SizedBox()
      ],
    );
  }
}
