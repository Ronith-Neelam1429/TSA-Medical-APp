import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final Offset iconPosition = overlay.localToGlobal(Offset.zero);

        // Calculate the center position based on the width of the popup
        double popupWidth =
            -190.0; // You can adjust this based on your popup width
        double centeredLeft = iconPosition.dx - popupWidth / 2;

        // Adjust the position to move the popup down and center horizontally
        Offset position = Offset(centeredLeft, iconPosition.dy + 109);

        // Declare and initialize the overlayEntry as late
        late OverlayEntry overlayEntry;

        // Create an overlay entry with the popup positioned at the calculated location
        overlayEntry = OverlayEntry(
          builder: (context) => Stack(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle tap outside the popup to remove it
                  overlayEntry.remove();
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                left: position.dx,
                top: position.dy,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle notification tap action
                            // For example, you can navigate to the notifications screen
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
                            overlayEntry.remove();
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 247, 247),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'View Notifications',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

        // Insert the overlay entry to display the popup
        Overlay.of(context).insert(overlayEntry);
      },
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ).createShader(bounds);
        },
        child: Container(
          child: const Icon(
            Icons.notifications,
            color: Colors.white, // Set the icon color as needed
            size: 45,
          ),
        ),
      ),
    );
  }
}
