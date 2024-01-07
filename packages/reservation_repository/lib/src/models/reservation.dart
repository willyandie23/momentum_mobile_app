import 'package:user_repository/user_repository.dart';

import '../entities/entities.dart';

class Reservation {
  String reservationId;
  String weddingDate;
  String cultureTheme;
  String budget;
  String description;
  DateTime createAt;
  MyUser myUser;

  Reservation({
    required this.reservationId,
    required this.weddingDate,
    required this.cultureTheme,
    required this.budget,
    required this.description,
    required this.createAt,
    required this.myUser,
  });

  static final empty = Reservation(
      reservationId: '',
      weddingDate: '',
      cultureTheme: '',
      budget: '',
      description: '',
      createAt: DateTime.now(),
      myUser: MyUser.empty);

  Reservation copyWith({
    String? reservationId,
    String? weddingDate,
    String? cultureTheme,
    String? budget,
    String? description,
    DateTime? createAt,
    MyUser? myUser,
  }) {
    return Reservation(
      reservationId: reservationId ?? this.reservationId,
      weddingDate: weddingDate ?? this.weddingDate,
      cultureTheme: cultureTheme ?? this.cultureTheme,
      budget: budget ?? this.budget,
      description: description ?? this.description,
      createAt: createAt ?? this.createAt,
      myUser: myUser ?? this.myUser,
    );
  }

  bool get isEmpty => this == Reservation.empty;
  bool get isNotEmpty => this != Reservation.empty;

  ReservationEntity toEntity() {
    return ReservationEntity(
      reservationId: reservationId,
      weddingDate: weddingDate,
      cultureTheme: cultureTheme,
      budget: budget,
      description: description,
      createAt: createAt,
      myUser: myUser,
    );
  }

  static Reservation fromEntity(ReservationEntity entity) {
    return Reservation(
      reservationId: entity.reservationId,
      weddingDate: entity.weddingDate,
      cultureTheme: entity.cultureTheme,
      budget: entity.budget,
      description: entity.description,
      createAt: entity.createAt,
      myUser: entity.myUser,
    );
  }

  @override
  String toString() {
    return '''Reservation: {
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
