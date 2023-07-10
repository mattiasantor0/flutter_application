class User{
 final String id;
 final String firstName;
 final String lastName;
 final String refreshToken;
 final String urlBackoffice;


  const User({
     required this.id,
     required this.firstName,
     required this.lastName,
     required this.refreshToken,
     required this.urlBackoffice,
    
  });



   factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'], 
      refreshToken: json['refresh_token'],
      urlBackoffice: json['url_backoffice'],
     
    );
  }
}