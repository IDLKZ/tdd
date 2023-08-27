import 'dart:convert';

import 'package:untitled/src/domain/entities/fact.dart';

class FactModel extends Fact{
  const FactModel({
    required super.status,
    required super.sId,
    required super.user,
    required super.text,
    required super.iV,
    required super.source,
    required super.updatedAt,
    required super.type,
    required super.createdAt,
    required super.deleted,
    required super.used
    });


    factory FactModel.fromJson (String source) => FactModel.fromMap(jsonDecode(source) as Map<String,dynamic>);

    FactModel.fromMap(Map<String,dynamic> json) :
      this(
            status : Status(verified: json["status"]["verified"], sentCount: json["status"]["sentCount"]),
            sId : json['_id'],
            user : json['user'],
            text : json['text'],
            iV : json['__v'],
            source : json['source'],
            updatedAt : json['updatedAt'],
            type : json['type'],
            createdAt : json['createdAt'],
            deleted : json['deleted'],
            used : json['used'],
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status']["verified"] = this.status.verified;
      data['status']["sentCount"] = this.status.sentCount;
    }
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['text'] = this.text;
    data['__v'] = this.iV;
    data['source'] = this.source;
    data['updatedAt'] = this.updatedAt;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['deleted'] = this.deleted;
    data['used'] = this.used;
    return data;
  }


}
