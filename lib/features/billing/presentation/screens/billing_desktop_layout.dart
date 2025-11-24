import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lodgitech/core/constants/app_routes.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/routing/navigation.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/billing/data/domain/use_case/add_fee_use_case.dart';
import 'package:lodgitech/features/billing/data/models/billing_block_item.dart';
import 'package:lodgitech/features/billing/data/models/fee_item.dart';
import 'package:lodgitech/features/billing/data/models/invoice.dart';
import 'package:lodgitech/features/billing/data/models/invoice_status.dart';
import 'package:lodgitech/features/billing/data/repository/invoice_repository_imp.dart';
import 'package:lodgitech/features/billing/presentation/viewmodel/invoice_cubit.dart';
import 'package:lodgitech/features/billing/presentation/viewmodel/invoice_states.dart';
import 'package:lodgitech/features/billing/presentation/widgets/add_fee_dialog.dart';
import 'package:lodgitech/features/billing/presentation/widgets/billing_search_bar_and_drop_down_menu.dart';
import 'package:lodgitech/features/billing/presentation/widgets/billing_statistics_list.dart';
import 'package:lodgitech/features/billing/presentation/widgets/invoice_table.dart';

class BillingDesktopLayout extends StatelessWidget {
  const BillingDesktopLayout({super.key});
  static final List<BillingBlockItem> billings = [
    BillingBlockItem(
      title: "Total Revenue",
      description: "Paid invoices",
      value: 1699,
      icon: FontAwesomeIcons.moneyBill,
    ),
    BillingBlockItem(
      title: "Pending Revenue",
      description: "Awaiting payment",
      value: 1083.5,
      icon: FontAwesomeIcons.calendar,
    ),
    BillingBlockItem(
      title: "Total Invoices",
      description: "This month",
      value: 3,
      icon: FontAwesomeIcons.newspaper,
    ),
  ];
  static final List<Invoice> invoices = [
    Invoice(
      id: "INV001",
      guestName: "John Doe",
      guestEmail: "john.doe@example.com",
      room: "101",
      roomType: "Deluxe",
      from: DateTime(2025, 1, 10),
      to: DateTime(2025, 1, 15),
      status: InvoiceStatus.pending,
      fees: [
        FeeItem(type: FeeType.roomCharges, amount: 2500.0),
        FeeItem(type: FeeType.roomService, amount: 120.0),
        FeeItem(type: FeeType.laundry, amount: 50.0),
        FeeItem(type: FeeType.spaTreatment, amount: 300.0),
        FeeItem(type: FeeType.taxes, amount: 250.0),
      ],
      paymentMethod: null,
    ),
    Invoice(
      id: "INV002",
      guestName: "Sarah Ahmed",
      guestEmail: "sarah.ahmed@example.com",
      room: "205",
      roomType: "Suite",
      from: DateTime(2025, 2, 1),
      to: DateTime(2025, 2, 5),
      status: InvoiceStatus.paid,
      fees: [
        FeeItem(type: FeeType.roomCharges, amount: 4000.0),
        FeeItem(type: FeeType.roomService, amount: 0.0),
        FeeItem(type: FeeType.laundry, amount: 100.0),
        FeeItem(type: FeeType.spaTreatment, amount: 500.0),
        FeeItem(type: FeeType.taxes, amount: 410.0),
      ],
      paymentMethod: "Credit Card",
    ),
    Invoice(
      id: "INV003",
      guestName: "Michael Brown",
      guestEmail: "michael.brown@example.com",
      room: "310",
      roomType: "Standard",
      from: DateTime(2025, 3, 5),
      to: DateTime(2025, 3, 7),
      status: InvoiceStatus.pending,
      fees: [
        FeeItem(type: FeeType.roomCharges, amount: 800.0),
        FeeItem(type: FeeType.roomService, amount: 50.0),
        FeeItem(type: FeeType.laundry, amount: 0.0),
        FeeItem(type: FeeType.spaTreatment, amount: 0.0),
        FeeItem(type: FeeType.taxes, amount: 85.0),
      ],
      paymentMethod: "Cash",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => InvoiceCubit(
          AddFeeToInvoiceUseCase(
            repository: InvoiceRepositoryImpl(initialInvoices: invoices),
          ),
          initialInvoices: invoices,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HeaderOfScreen(titleOfScreen: "Billing")),
            SliverToBoxAdapter(
              child: BillingStatisticsList(billings: billings),
            ),
            SliverToBoxAdapter(child: verticalSpace(12)),
            BillingSearchBarAndDropDownMenu(),
            SliverToBoxAdapter(
              child: CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Invoices & Bills (3)",
                      style: AppStyles.semiBold14Black(context),
                    ),
                    Text(
                      "Manage guest billing and payments",
                      style: AppStyles.light12Black(
                        context,
                      ).copyWith(color: Colors.grey),
                    ),
                    BlocBuilder<InvoiceCubit, InvoiceStates>(
                      builder: (context, state) {
                        List<Invoice> invoices = [];
                        if (state is AddFeeInitial ||
                            state is AddFeeLoading ||
                            state is AddFeeSuccess ||
                            state is AddFeeError) {
                          invoices = state.invoices;
                        }

                        return InvoiceTable(
                          invoices: invoices,
                          onViewInvoice: (invoice) {
                            context.pushNamed(
                              AppRoutes.invoiceDetails,
                              arguments: invoice,
                            );
                          },
                          onAddFees: (invoice) {
                            showDialog(
                              context: context,
                              builder: (_) => AddFeeDialog(
                                onSubmit: (feeItem) {
                                  context.read<InvoiceCubit>().addFee(
                                    invoice.id,
                                    feeItem,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
