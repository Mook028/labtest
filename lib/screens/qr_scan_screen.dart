import 'package:flutter/material.dart';
import '../models/history_model.dart';

class QRScanScreen extends StatelessWidget {
  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.blue.withOpacity(0.08), blurRadius: 24, spreadRadius: 8),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.qr_code_scanner_rounded, size: 140, color: Colors.blue.shade200),
                      // Corner guides
                      Positioned(top: 20, left: 20, child: _buildCornerGuide(true, true)),
                      Positioned(top: 20, right: 20, child: _buildCornerGuide(true, false)),
                      Positioned(bottom: 20, left: 20, child: _buildCornerGuide(false, true)),
                      Positioned(bottom: 20, right: 20, child: _buildCornerGuide(false, false)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Check-in Successful', style: TextStyle(fontSize: 16)),
                    backgroundColor: Colors.green.shade500,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                );

                // The QR scan now doesn't add anything natively since it got bypassed/separated or handled by History.
                // Normally this would parse the QR data and act upon it.

                // Navigate back to home
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.qr_code_rounded, size: 24),
              label: const Text('Scan QR', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCornerGuide(bool top, bool left) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          top: top ? BorderSide(color: Colors.blue.shade400, width: 4) : BorderSide.none,
          bottom: !top ? BorderSide(color: Colors.blue.shade400, width: 4) : BorderSide.none,
          left: left ? BorderSide(color: Colors.blue.shade400, width: 4) : BorderSide.none,
          right: !left ? BorderSide(color: Colors.blue.shade400, width: 4) : BorderSide.none,
        ),
        borderRadius: BorderRadius.only(
          topLeft: top && left ? const Radius.circular(8) : Radius.zero,
          topRight: top && !left ? const Radius.circular(8) : Radius.zero,
          bottomLeft: !top && left ? const Radius.circular(8) : Radius.zero,
          bottomRight: !top && !left ? const Radius.circular(8) : Radius.zero,
        ),
      ),
    );
  }
}
