import 'package:equatable/equatable.dart';

class Fact extends Equatable{
  final Status status;
  final String sId;
  final String user;
  final String text;
  final int iV;
  final String source;
  final String updatedAt;
  final String type;
  final String createdAt;
  final bool deleted;
  final bool used;

  const Fact(
  {
    required this.status,
    required this.sId,
    required this.user,
    required this.text,
    required this.iV,
    required this.source,
    required this.updatedAt,
    required this.type,
    required this.createdAt,
    required this.deleted,
    required this.used
    });

  @override
  // TODO: implement props
  List<Object?> get props => [sId,text];

}

class Status extends Equatable
{
  final bool verified;
  final int sentCount;


  const Status({required this.verified, required this.sentCount});

  @override
  // TODO: implement props
  List<Object?> get props => [verified,sentCount];


}