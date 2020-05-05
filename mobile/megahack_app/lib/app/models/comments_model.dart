class Comment {
  String uid;
  String uidPublication;
  String uidUser;
  String userName;
  String avatarUrl;
  String description;

  Comment(
      {this.uid,
        this.uidPublication,
        this.uidUser,
        this.userName,
        this.avatarUrl,
        this.description});

  Comment.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    uidPublication = json['uid_publication'];
    uidUser = json['uid_user'];
    userName = json['user_name'];
    avatarUrl = json['avatar_url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uid_publication'] = this.uidPublication;
    data['uid_user'] = this.uidUser;
    data['user_name'] = this.userName;
    data['avatar_url'] = this.avatarUrl;
    data['description'] = this.description;
    return data;
  }
}
