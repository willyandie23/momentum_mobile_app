import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservation_repository/src/models/reservation.dart';
import 'package:uuid/uuid.dart';

import 'reservation_repo.dart';

class FirebasePostRepository implements ReservationRepository {
  final reservationCollection =
      FirebaseFirestore.instance.collection('reservations');
  @override
  Future<Reservation> createReservation(Reservation reservation) async {
    try {
      reservation.reservationId = const Uuid().v1();
      reservation.createAt = DateTime.now();

      await reservationCollection
          .doc(reservation.reservationId)
          .set(reservation.toEntity().toDocument());
      return reservation;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
