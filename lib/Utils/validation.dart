class Validation {
  // validation for mobile
  static String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length < 10) {
      return "Invalid Mobile Number";
    }
    return null;
  }

  // validation for email
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (!RegExp(
            r"^[a-zA-Z\d.a-zA-Z!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  // validation for password
  static String? validatePass(String? value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length < 8) {
      return "Should at least 8 characters";
    }
    return null;
  }

// validation
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return "Required";
    }
    return null;
  }

  // validation for IFSC Code
  static String? validateIfsc(String? value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length < 11) {
      return "length should be 11";
    } else if (
        // !RegExp(r'^[a-zA-Z0-9]+$')
        !RegExp(r'^[A-Z]{4}0[A-Z\d]{6}$').hasMatch(value)) {
      return "Invalid IFSC Code";
    }
    return null;
  }

  /// validation for Aadhaar Number
  static String? validateAadhaar(String? value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length != 12) {
      return "Invalid Aadhaar Number";
    }
    return null;
  }

  /// validation for PAN Number
  static String? validatePan(String? value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (!RegExp("^([A-Z]){5}([0-9]){4}([A-Z]){1}?\$").hasMatch(value)) {
      return "Invalid PAN Number";
    }
    return null;
  }
}
