String? validator(value) {
  if (value!.isEmpty || value == null) {
    return "Amount cannot be Empty";
  } else {
    if (RegExp(r'[0-9.]+').hasMatch(value)) {
      return null;
    } else {
      return "Enter Valid Amount";
    }
  }
}
