String? validateusername(String? value) {
  if (value == null || value.isEmpty) {
    return "Enter the Username";
  }
  return null;
}

String? validatepassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Enter the password";
  }
  return null;
}
