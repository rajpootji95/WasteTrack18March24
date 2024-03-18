class Endpoints {
  Endpoints._();

  //baseURL
  static const String baseUrl = "http://matchitsports.com:3000/api/";

  //imageURL
  static const String imageUrl = "http://162.0.208.12:3000/uploads/";

  // Auth
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String role = "roles";
  static const String forgot = "auth/forget-password";
  static const String profile = "auth/get-profile";
  static const String update = "auth/update-profile";
  static const String update_Password = "auth/update-password-with-current";

  //SubAdmin
  static const String subAdmin = "subadmin/add-subadmin";
  static const String getSubAdmin = "subadmin/subadmin-listing";
  static const String deleteSubAdmin = "subadmin/delete-subadmin";
  static const String updateSubAdmin = "subadmin/update-single-subadmin";

  //EcoBlueSubAdmin
  static const String ecoBlueSubAdmin = "ecoblue/add-ecoblue-admin";
  static const String getEcoBlueSubAdmin = "ecoblue/ecoblue-admin-listing";
  static const String deleteEcoBlueSubAdmin = "ecoblue/delete-ecoblue-admin";
  static const String updateEcoBlueSubAdmin = "ecoblue/update-single-ecoblue";

  //Waste Management Agency
  static const String addWasteAgency = "wasteagency/add-wasteagency";
   static const String getWasteAgency = "wasteagency/get-single-wasteagency";
  static const String deleteWasteAgency = "wasteagency/delete-wasteagency";
 static const String updateWasteAgency = "wasteagency/update-single-wasteagency";


  // receiveTimeout
  static const Duration receiveTimeout =
      Duration(milliseconds: 15000); // 15000;

  // connectTimeout
  static const Duration connectionTimeout =
      Duration(milliseconds: 15000); //15000;
}

