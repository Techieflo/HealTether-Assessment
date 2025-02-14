class User {
  //this line creates a variable string name  and email for the required fields we would be using in the UI and fetching from the API
  final String name;
  final String email;

  User(
      {required this.name,
      required this.email}); // this is set as required so that they are never nullable. these parameters cannot be empty from the api
// this method convert the json response into variables that can be used and would be displayed in the UI.
//this is then passed and returns a user Model as a response
  factory User.fromJson(Map<String, dynamic> json) {
    //out of all feilds we can gt from the database; we would only make use of name and email parameter
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}
