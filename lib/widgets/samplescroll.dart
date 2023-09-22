// import 'package:flutter/widgets.dart';

// class AutomatedScrollPhysics extends ScrollPhysics {
//   const AutomatedScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

//   @override
//   AutomatedScrollPhysics applyTo(ScrollPhysics? ancestor) {
//     return AutomatedScrollPhysics(parent: buildParent(ancestor));
//   }

//   @override
//   Simulation createBallisticSimulation(
//     ScrollMetrics position,
//     double velocity,
//   ) {
//     // Calculate the target position where you want the scroll to stop automatically.
//     // You can set a specific offset or use some logic to determine the stopping point.

//     // Calculate the time it should take to scroll to the target.
//     const Duration time = Duration(seconds: 1); // Adjust the duration as needed.

//     // Decrease the stiffness to slow down the scrolling speed.
//     // Increase the damping to control the springiness of the scroll.
//     final SpringDescription spring = SpringDescription.withDampingRatio(
//       mass: 0.2,
//       stiffness: 50.0, // Decrease this value for slower scrolling.
//       ratio: 0.8, // Adjust damping ratio as needed.
//     );

//     // Decrease the velocity tolerance to slow down the scrolling.
//     final Tolerance tolerance = Tolerance(
//       time: time.inMilliseconds.toDouble(),
//       velocity: 0.01, // Decrease this value for slower scrolling.
//     );

//     // Create a custom simulation that automatically scrolls to the target position.
//     return ScrollSpringSimulation(spring, position.maxScrollExtent, 0, velocity, tolerance: tolerance);
//   }
// }
