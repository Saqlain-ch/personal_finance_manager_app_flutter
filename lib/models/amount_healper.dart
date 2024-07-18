// String formatAmount(String amount) {
//   if (double.tryParse(amount)?.toStringAsFixed(2).contains('.') ?? false) {
//     return double.parse(amount).toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
//   } else {
//     return double.parse(amount).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
//   }
// }

String formatAmount(String amount) {
  double? parsedAmount = double.tryParse(amount);

  if (parsedAmount == null) {
    return amount; // Return the original string if parsing fails
  }

  // Check if the amount has a fractional part
  String formattedAmount;
  if (parsedAmount % 1 == 0) {
    // No fractional part, format without decimals
    formattedAmount = parsedAmount.toInt().toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  } else {
    // Has fractional part, format with two decimals
    formattedAmount = parsedAmount.toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  return formattedAmount;
}


String checkAndFormatAmount(String amount) {
  // Remove any existing commas and extra spaces
  String cleanedAmount = amount.replaceAll(',', '').trim();
  // If the amount is valid, return the cleaned amount as a string
  return cleanedAmount;
}