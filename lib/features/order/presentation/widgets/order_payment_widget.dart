import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class OrderPaymentWidget extends StatelessWidget {
  const OrderPaymentWidget({
    super.key,
    required this.total,
  });

  final double ?total;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight, // Use a light background color
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Amount to Pay Section
          _buildAmountToPay(context, s),
          const SizedBox(height: 20),

          // Payment Instructions Section
          _buildPaymentInstructions(context, s),
        ],
      ),
    );
  }

  Widget _buildAmountToPay(BuildContext context, S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.amountToPay,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "${total ?? '0'} ${s.sar}",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentInstructions(BuildContext context, S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.sendMoneyToThisNumber,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        _buildCopyableAccountNumber(context),
      ],
    );
  }

  Widget _buildCopyableAccountNumber(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(const ClipboardData(text: '558412655'));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account number copied to clipboard!'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '558412655',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.copy,
              size: 18,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}