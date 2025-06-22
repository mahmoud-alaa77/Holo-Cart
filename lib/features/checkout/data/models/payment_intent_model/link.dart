class Link {
  dynamic persistentToken;

  Link({this.persistentToken});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        persistentToken: json['persistent_token'],
      );

  Map<String, dynamic> toJson() => {
        if (persistentToken != null) 'persistent_token': persistentToken,
      };
}
