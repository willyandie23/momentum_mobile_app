// import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_momentum_app/blocs/create_reservation_bloc/create_reservation_bloc.dart';
import 'package:reservation_repository/reservation_repository.dart';
import 'package:user_repository/user_repository.dart';

class ReservationScreen extends StatefulWidget {
  final MyUser myUser;
  const ReservationScreen(this.myUser, {super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  late Reservation reservation;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _culturThemeController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    reservation = Reservation.empty;
    reservation.myUser = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateReservationBloc, CreateReservationState>(
      listener: (context, state) {
        if (state is CreateReservationSuccess) {
          Navigator.pop(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                reservation.weddingDate = _dateController.text;
                reservation.cultureTheme = _culturThemeController.text;
                reservation.budget = _budgetController.text;
                reservation.description = _descriptionController.text;
              });
              context
                  .read<CreateReservationBloc>()
                  .add(CreateReservation(reservation));
              // log(reservation.toString());
            },
            child: const Icon(CupertinoIcons.add),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text('Reservation Momentum'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _dateController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Date",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _culturThemeController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Culture and Themes",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _budgetController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Budget (On Rupiah)",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _descriptionController,
                    minLines: 1,
                    maxLines: 10,
                    // maxLength: 500,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Another Description",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
