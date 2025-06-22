import 'associated_object.dart';

class EmphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  num? created;
  num? expires;
  bool? livemode;
  String? secret;

  EmphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EmphemeralKeyModel.fromJson(Map<String, dynamic> json) =>
      EmphemeralKeyModel(
        id: json['id']?.toString(),
        object: json['object']?.toString(),
        associatedObjects: (json['associated_objects'] as List<dynamic>?)
            ?.map(
                (e) => AssociatedObject.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        created: num.tryParse(json['created'].toString()),
        expires: num.tryParse(json['expires'].toString()),
        livemode: json['livemode']?.toString().contains("true"),
        secret: json['secret']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (object != null) 'object': object,
        if (associatedObjects != null)
          'associated_objects':
              associatedObjects?.map((e) => e.toJson()).toList(),
        if (created != null) 'created': created,
        if (expires != null) 'expires': expires,
        if (livemode != null) 'livemode': livemode,
        if (secret != null) 'secret': secret,
      };
}
