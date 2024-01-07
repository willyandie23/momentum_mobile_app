import 'package:user_repository/user_repository.dart';

class ReservationEntity {
  String reservationId;
  String weddingDate;
  String cultureTheme;
  String budget;
  String description;
  DateTime createAt;
  MyUser myUser;

  ReservationEntity({
    required this.reservationId,
    required this.weddingDate,
    required this.cultureTheme,
    required this.budget,
    required this.description,
    required this.createAt,
    required this.myUser,
  });

  Map<String, Object?> toDocument() {
    return {
      'reservationId': reservationId,
      'weddingDate': weddingDate,
      'cultureTheme': cultureTheme,
      'budget': budget,
      'description': description,
      'createAt': createAt,
      'myUser': myUser.toEntity().toDocument(),
    };
  }

  static ReservationEntity fromDocument(Map<String, dynamic> doc) {
    return ReservationEntity(
      reservationId: doc['reservationId'] as String,
      weddingDate: doc['weddingDate'] as String,
      cultureTheme: doc['cultureTheme'] as String,
      budget: doc['budget'] as String,
      description: doc['description'] as String,
      createAt: DateTime.parse(doc['createAt']),
      myUser: MyUser.fromEntity(MyUserEntity.fromDocument(doc['myUser'])),
    );
  }

  @override
  List<Object?> get props => [
        reservationId,
        weddingDate,
        cultureTheme,
        budget,
        description,
        createAt,
        myUser
      ];

  @override
  String toString() {
    return '''ReservationEntity: {
      reservationId: $reservationId
      weddingDate: $weddingDate
      cultureTheme: $cultureTheme
      budget: $budget
      description: $description
      createAt: $createAt
      myUser: $myUser
    }''';
  }
}
