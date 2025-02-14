import 'package:flutter/material.dart';

class GradientCard extends StatefulWidget {
  final String title; // Title of the card (e.g., "Cleaning Services")
  final IconData icon; // Icon for the card
  final VoidCallback onTap; // Action on clicking the card

  const GradientCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  _GradientCardState createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Glowing Background
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              width: 180,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isHovered
                      ? [Color(0xFFFC00FF), Color(0xFF00DBDE)]
                      : [Color(0xFF6C63FF), Color(0xFF00AFC1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: isHovered
                        ? Colors.purpleAccent.withOpacity(0.4)
                        : Colors.transparent,
                    blurRadius: 30,
                  ),
                ],
              ),
            ),

            // Card
            Container(
              width: 170,
              height: 190,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon
                  Icon(
                    widget.icon,
                    size: 40,
                    color: isHovered ? Colors.white : Colors.grey,
                  ),
                  SizedBox(height: 16),

                  // Card Title
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
