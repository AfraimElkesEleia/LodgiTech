import 'package:flutter/material.dart';
import 'package:lodgitech/features/reservation/data/models/reservations.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/check_in_out_section.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/guest_info_section.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/nights_summary.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/phone_and_guest_section.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/reservation_form_header.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/room_and_requests_section.dart';
import 'package:lodgitech/features/reservation/presentation/widgets/submit_reservation_button.dart';

class ReservationFormScreen extends StatefulWidget {
  final Reservation? reservation;

  const ReservationFormScreen({super.key, this.reservation});

  @override
  State<ReservationFormScreen> createState() => _ReservationFormScreenState();
}

class _ReservationFormScreenState extends State<ReservationFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _specialRequestsController = TextEditingController();

  // Selected values
  String? _selectedGuests = "1 Guest";
  String? _selectedRoomType = "Standard Room";
  DateTime? _checkInDate;
  DateTime? _checkOutDate;

  bool get _isEditMode => widget.reservation != null;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (_isEditMode) {
      final reservation = widget.reservation!;
      _nameController.text = reservation.name;
      _emailController.text = reservation.email;
      _selectedRoomType = reservation.roomType;
      _checkInDate = reservation.from;
      _checkOutDate = reservation.to;
      _selectedGuests = '${reservation.nights} Guests';
      // Note: You might need to adjust based on your actual data structure
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _specialRequestsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      final reservation = Reservation(
        id: _isEditMode
            ? widget.reservation!.id
            : DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        email: _emailController.text,
        room: _isEditMode
            ? widget.reservation!.room
            : 'TBD', // You might want a room selection
        roomType: _selectedRoomType!,
        from: _checkInDate!,
        to: _checkOutDate!,
        nights: _checkOutDate!.difference(_checkInDate!).inDays,
        status: _isEditMode ? widget.reservation!.status : 'Confirmed',
        price: _isEditMode
            ? widget.reservation!.price
            : 0.0, // Calculate based on room type
      );

      print('Reservation ${_isEditMode ? 'updated' : 'created'}: $reservation');

      Navigator.of(context).pop(reservation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          _isEditMode ? 'Edit Reservation' : 'New Reservation',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReservationFormHeader(isEdit: _isEditMode),

                GuestInfoSection(
                  nameController: _nameController,
                  emailController: _emailController,
                ),

                PhoneAndGuestsSection(
                  phoneController: _phoneController,
                  selectedGuests: _selectedGuests,
                  onSelectGuests: (value) {
                    setState(() => _selectedGuests = value);
                  },
                ),

                CheckInOutSection(
                  checkIn: _checkInDate,
                  checkOut: _checkOutDate,
                  onCheckInSelected: (date) {
                    setState(() {
                      _checkInDate = date;
                      if (_checkOutDate == null ||
                          _checkOutDate!.isBefore(date)) {
                        _checkOutDate = date.add(const Duration(days: 1));
                      }
                    });
                  },
                  onCheckOutSelected: (date) {
                    setState(() => _checkOutDate = date);
                  },
                ),

                RoomAndRequestsSection(
                  selectedRoom: _selectedRoomType,
                  onRoomSelected: (value) {
                    setState(() => _selectedRoomType = value);
                  },
                  specialRequestsController: _specialRequestsController,
                ),

                NightsSummary(checkIn: _checkInDate, checkOut: _checkOutDate),

                SubmitReservationButton(
                  isEditMode: _isEditMode,
                  onSubmit: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
