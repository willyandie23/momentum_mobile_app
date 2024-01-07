import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_repository/reservation_repository.dart';

part 'create_reservation_event.dart';
part 'create_reservation_state.dart';

class CreateReservationBloc
    extends Bloc<CreateReservationEvent, CreateReservationState> {
  ReservationRepository _reservationRepository;

  CreateReservationBloc({required ReservationRepository reservationRepository})
      : _reservationRepository = reservationRepository,
        super(CreateReservationInitial()) {
    on<CreateReservation>((event, emit) async {
      emit(CreateReservationLoading());
      try {
        Reservation reservation =
            await _reservationRepository.createReservation(event.reservation);
        emit(CreateReservationSuccess(reservation));
      } catch (e) {
        emit(CreateReservationFailure());
      }
    });
  }
}
