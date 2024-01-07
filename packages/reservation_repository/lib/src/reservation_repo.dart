import 'models/models.dart';

abstract class ReservationRepository {
  Future<Reservation> createReservation(Reservation reservation);
}
