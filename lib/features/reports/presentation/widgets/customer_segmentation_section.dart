import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/features/reports/data/models/customer_segmentation_model.dart';

class CustomerSegmentationSection extends StatelessWidget {
  const CustomerSegmentationSection({super.key});
  static final List<CustomerSegmentationModel> customers = [
    CustomerSegmentationModel(
      dotColor: Colors.purple,
      title: "Business",
      noOfGuests: 145,
      percentage: 42,
    ),
    CustomerSegmentationModel(
      dotColor: Colors.purple,
      title: "Leisure",
      noOfGuests: 98,
      percentage: 28,
    ),
    CustomerSegmentationModel(
      dotColor: Colors.purple,
      title: "Group",
      noOfGuests: 67,
      percentage: 19,
    ),
    CustomerSegmentationModel(
      dotColor: Colors.purple,
      title: "VIP",
      noOfGuests: 38,
      percentage: 11,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Segmentation",
            style: AppStyles.semiBold14Black(context),
          ),
          Text(
            "Guest distribution by customer type",
            style: AppStyles.extraLight14Grey(context),
          ),
          verticalSpace(10),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: customers.length,
            itemBuilder: (context, index) => CustomContainer(
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customers[index].title,
                          style: AppStyles.semiBold14Black(context),
                        ),
                        Text(
                          "${customers[index].noOfGuests} guests",
                          style: AppStyles.light12Black(
                            context,
                          ).copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(32),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      child: Text("${customers[index].percentage}%"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
