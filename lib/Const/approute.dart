import 'package:get/get.dart';
import 'package:universal_b2b/Screens/AddProducts/add_brand_screen.dart';
import 'package:universal_b2b/Screens/AddProducts/add_category_screen.dart';
import 'package:universal_b2b/Screens/AddProducts/add_uom_screen.dart';
import 'package:universal_b2b/Screens/Master/Bank/Add%20Bank%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Company/Company%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Company/Manage%20User%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Currency%20Screen/Add%20Currency%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Customer/ApprovedCustomer/ApprovedCustomerScreen.dart';
import 'package:universal_b2b/Screens/Master/Customer/ApprovedCustomer/Pending%20Order/Pending%20Order%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Customer/ApprovedCustomer/Pending%20Order/PendingOrderDetails%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Customer/ApprovedCustomer/TotalOrders/TotalOrders.dart';
import 'package:universal_b2b/Screens/Master/Customer/RequestCustomer%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Supplier/Payment/PaidDetailsScreen.dart';
import 'package:universal_b2b/Screens/Master/Supplier/PurchaseAnalysis/SupplierPrchAnalysisScreen.dart';
import 'package:universal_b2b/Screens/Master/Supplier/Request%20Quotation/Request%20Quotation%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Tax/Add%20Tax%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Terms/Add%20Terms%20Screen.dart';
import 'package:universal_b2b/Screens/Purchase/Purchase%20Invoice/Add_PurchaseInvoice_Screen.dart';
import 'package:universal_b2b/Screens/Purchase/Purchase%20Order/Add%20Purchase%20Order.dart';
import 'package:universal_b2b/Screens/Purchase/Purchase%20Quatation/Add_Quatation_Screen.dart';
import 'package:universal_b2b/Screens/Purchase/Purchase%20Quatation/Quatation%20List%20Screen.dart';
import 'package:universal_b2b/Screens/Purchase/Purchase_Analysis_Screen/Purchase%20Analysis_Screen.dart';
import 'package:universal_b2b/Screens/Sales/Analysis/Sales%20Anaysis%20Screen.dart';
import 'package:universal_b2b/Screens/Sales/Invoice/Add%20SalesInvoice%20Screen.dart';
import 'package:universal_b2b/Screens/Sales/Sales%20Quatation/Sales%20Quatation%20List%20Screen.dart';

import '../Screens/AddProducts/add_subcategory_screen.dart';
import '../Screens/AddProducts/addproductsscreen.dart';
import '../Screens/BottomNavBar/bottomnavbar.dart';
import '../Screens/DashBoard/dashboardscreen.dart';
import '../Screens/ForgotPassword/ResetPassword/resetpassword.dart';
import '../Screens/ForgotPassword/forgotpasswordscreen.dart';
import '../Screens/ForgotPassword/otpscreen.dart';
import '../Screens/Login/loginscreen.dart';
import '../Screens/Master/Company/ManageUserViewdetails Screen.dart';
import '../Screens/Master/Customer/ApprovedCustomer/Customer Invoice/ApprovedCustomerInvoice Screen.dart';
import '../Screens/Master/Customer/ApprovedCustomer/FrequentOrder/FrequentOdrerScreen.dart';
import '../Screens/Master/Customer/ApprovedCustomer/TotalOrders/TotalOrderDetails.dart';
import '../Screens/Master/Pay Mode/Add Paymode screen.dart';
import '../Screens/Master/Supplier/Payment/PaymentScreen.dart';
import '../Screens/Master/Supplier/Product Catelouge Screen.dart';
import '../Screens/Master/Supplier/Supplier Profile Screen.dart';
import '../Screens/Products/Product DashBoard Screen.dart';
import '../Screens/Products/ProductsListing/productlistingscreen.dart';
import '../Screens/Registartion/ContactInformation/contactinformationscreen.dart';
import '../Screens/Registartion/Profile/profilescreen.dart';
import '../Screens/Registartion/RegistrationDetails/registrationscreen.dart';
import '../Screens/Sales/Sales Order/Add SalesOrder Screen.dart';


class Routes {
  static const String loginScreen = "/LoginScreen";
  static const String registrationScreen = "/RegistrationScreen";
  static const String contactInformationScreen = "/contactInformationScreen";
  static const String profileDetailScreen = "/ProfileDetailScreen";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String oTPScreen = "/OTPScreen";
  static const String resetPassword = "/ResetPassword";
  static const String bottomNavBar = "/BottomNavBar";
  static const String dashBoardScreen = "/DashBoardScreen";
  static const String addProductsScreen = "/AddProductsScreen";
  static const String productListingPage = "/ProductListingPage";
  static const String addcategoryscreen = "/AddCategoryScreen";
  static const String addsubcategoryscreen = "/AddSubCategoryScreen";
  static const String adduomscreen = "/AddUOMScreen";
  static const String addbrandscreen = "/AddBrandScreen";
  static const String quatationlistscreen = "/QuatationListScreen";
  static const String addquatationscreen = "/AddQuatationScreen";
  static const String productdashboard = "/ProductDashBoard";
  static const String addpurchaseorder = "/AddPurchaseOrderScreen";
  static const String addinvoicescreen = "/AddPurchaseInvoiceScreen";
  static const String purchaseanalyticsscreen = "/PurchaseAnalysisScreen";
  static const String salesquatationscreen = "/SalesQuatationScreen";
  static const String addsalesorderscreen = "/AddSalesOrderScreen";
  static const String addsalesinvoivescreen = "/AddSalesInvoiceScreen";
  static const String addcurrencyscreen = "/AddCurrencyScreen";
  static const String addtermsscrren = "/AddTermsScreen";
  static const String salesanalysisscreen = "/SalesAnalysisScreen";
  static const String addtaxscreen = "/AddTaxScreen";
  static const String addpaymodescreen = "/AddPayModeScreen";
  static const String addbankscreen = "/AddBankScreen";
  static const String companyscreen = "/CompanyScreen";
  static const String manageuserlistscreen = "/ManageUserListScreen";
  static const String manageuserviewscreen = "/ManageUserViewScreen";
  static const String requestcustomerscreen = "/RequestCustomerScreen";
  static const String supplierprofilescreen = "/SupplierProfileScreen";
  static const String productcataloguescreeen = "/ProductCatelougeScreen";
  static const String paymentScreen = "/PaymentScreen";
  static const String paidDetailsScreen = "/PaidDetailsScreen";
  static const String supplierPurAnalysisScreen = "/SupplierPurAnalysisScreen";
  static const String approvedCustomerScreen = "/ApprovedCustomerScreen";
  static const String totalOrdersScreen = "/TotalOrdersScreen";
  static const String pendingOrdersScreen = "/PendingOrdersScreen";
  static const String totalOrderDetailsScreen = "/TotalOrderDetails";
  static const String pendingOrderDetailsScreen = "/PendingOrderDetails";
  static const String approvedCustomerInvoiceScreen = "/ApprovedCustomerInvoiceScreen";
  static const String approvedCustomerFrequentorderScreen = "/ApprovedCustomerFrequentOrderScreen";
  static const String requestquotationscreen = "/RequesrQuotationScreen";
}

final pages = [
  GetPage(name: Routes.loginScreen, page: () => const LoginScreen()),
  GetPage(name: Routes.registrationScreen, page: () => const RegistrationScreen()),
  GetPage(name: Routes.contactInformationScreen, page: () => const ContactInformationScreen()),
  GetPage(name: Routes.profileDetailScreen, page: () => const ProfileDetailScreen()),
  GetPage(name: Routes.forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
  GetPage(name: Routes.oTPScreen, page: () => const OTPScreen()),
  GetPage(name: Routes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: Routes.bottomNavBar, page: () => const BottomNavBar()),
  GetPage(name: Routes.dashBoardScreen, page: () => const DashBoardScreen()),
  GetPage(name: Routes.addProductsScreen, page: () => const AddProductsScreen()),
  GetPage(name: Routes.productListingPage, page: () => const ProductListingPage()),
  GetPage(name: Routes.addcategoryscreen, page: () => const AddCategoryScreen()),
  GetPage(name: Routes.addsubcategoryscreen, page: () => const AddSubCategoryScreen()),
  GetPage(name: Routes.adduomscreen, page: () => const AddUOMScreen()),
  GetPage(name: Routes.addbrandscreen, page: () => const AddBrandScreen()),
  GetPage(name: Routes.quatationlistscreen, page: () => const QuatationListPage()),
  GetPage(name: Routes.addquatationscreen, page: () => const AddQuatationScreen()),
  GetPage(name: Routes.productdashboard, page: () => const ProductScreen()),
  GetPage(name: Routes.addpurchaseorder, page: () => const AddPurchaseOrderScreen()),
  GetPage(name: Routes.addinvoicescreen, page: () => const AddPurchaseInvoiceScreen()),
  GetPage(name: Routes.purchaseanalyticsscreen, page: () => const PurchaseAnalyticsScreen()),
  GetPage(name: Routes.salesquatationscreen, page: () => const SalesQuatationScreen()),
  GetPage(name: Routes.addsalesorderscreen, page: () => const addSalesOrderScreen()),
  GetPage(name: Routes.addsalesinvoivescreen, page: () => const AddSalesInvoiceScreen()),
  GetPage(name: Routes.addcurrencyscreen, page: () => const AddCurrencyScreen()),
  GetPage(name: Routes.addtermsscrren, page: () => const AddTermsScreen()),
  GetPage(name: Routes.salesanalysisscreen, page: () => const SalesAnalysisScreen()),
  GetPage(name: Routes.addtaxscreen, page: () => const AddTaxScreen()),
  GetPage(name: Routes.addpaymodescreen, page: () => const AddPayModeScreen()),
  GetPage(name: Routes.addbankscreen, page: () => const AddBankScreen()),
  GetPage(name: Routes.companyscreen, page: () => const CompanyScreen()),
  GetPage(name: Routes.manageuserlistscreen, page: () => const ManageUserListScreen()),
  GetPage(name: Routes.manageuserviewscreen, page: () => const ManageUserViewScreen()),
  GetPage(name: Routes.requestcustomerscreen, page: () => const RequestCustomerScreen()),
  GetPage(name: Routes.supplierprofilescreen, page: () => const SupplierProfileScreen()),
  GetPage(name: Routes.productcataloguescreeen, page: () => const ProductCatalogueScreen()),
  GetPage(name: Routes.paymentScreen, page: () => const PaymentScreen()),
  GetPage(name: Routes.paidDetailsScreen, page: () => const PaidDetailsScreen()),
  GetPage(name: Routes.supplierPurAnalysisScreen, page: () => const SupplierPurAnalysisScreen()),
  GetPage(name: Routes.approvedCustomerScreen, page: () => const ApprovedCustomerScreen()),
  GetPage(name: Routes.totalOrdersScreen, page: () => const TotalOrdersScreen()),
  GetPage(name: Routes.pendingOrdersScreen, page: () => const PendingOrderScreen()),
  GetPage(name: Routes.totalOrderDetailsScreen, page: () => const TotalOrderDetails()),
  GetPage(name: Routes.pendingOrderDetailsScreen, page: () => const PendingOrderDetailsScreen()),
  GetPage(name: Routes.approvedCustomerInvoiceScreen, page: () => const ApprovedCustomerInvoiceScreen()),
  GetPage(name: Routes.approvedCustomerFrequentorderScreen, page: () => const FrequentOrderScreen()),
  GetPage(name: Routes.requestquotationscreen, page: () => const RequestQuotationScreen()),

];
