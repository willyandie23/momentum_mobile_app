part of 'create_reservation_bloc.dart';

sealed class CreateReservationState extends Equatable {
  const CreateReservationState();

  @override
  List<Object> get props => [];
}

final class CreateReservationInitial extends CreateReservationState {}

final class CreateReservationFailure extends CreateReservationState {}

final class CreateReservationLoading extends CreateReservationState {}

final class CreateReservationSuccess extends CreateReservationState {
  final Reservation reservation;

  const CreateReservationSuccess(this.reservation);
}
