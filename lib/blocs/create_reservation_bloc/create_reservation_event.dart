part of 'create_reservation_bloc.dart';

sealed class CreateReservationEvent extends Equatable {
  const CreateReservationEvent();

  @override
  List<Object> get props => [];
}

class CreateReservation extends CreateReservationEvent {
  final Reservation reservation;

  const CreateReservation(this.reservation);
}
