class User {
  String? name;
  String? password;
  String? email;
  String? tel;
  String? role;
  List<String>? usrCollect;
  User({this.name,this.password,this.email,this.tel,this.role,this.usrCollect}){
    email = "No email";
    tel = "No tel";
    role = "usr";
    usrCollect = [];
  }
}