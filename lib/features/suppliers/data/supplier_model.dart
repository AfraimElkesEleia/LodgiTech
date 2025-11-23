class SupplierModel {
  final String name;                 
  final String category;             
  final String contactPerson;        
  final String email;
  final String phone;
  final String address;

  final int totalOrders;             
  final double totalSpend;           
  final double avgOrderValue;        

  final List<String> services;       
  
  final String status;               

  SupplierModel({
    required this.name,
    required this.category,
    required this.contactPerson,
    required this.email,
    required this.phone,
    required this.address,
    required this.totalOrders,
    required this.totalSpend,
    required this.avgOrderValue,
    required this.services,
    required this.status,
  });
}
