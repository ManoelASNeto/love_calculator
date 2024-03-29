import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'combination_result_gauge_range.dart';

class PercentGauge extends StatelessWidget {
  final double? percent;

  const PercentGauge({
    super.key,
    this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 0,
          maximum: 100,
          ranges: [
            CombinationResultGaugeRange(
              color: Colors.red.shade100.withOpacity(0.8),
              start: 0,
              end: 20,
              label: '10%',
            ),
            CombinationResultGaugeRange(
              color: Colors.red.shade200.withOpacity(0.8),
              start: 20,
              end: 40,
              label: '30%',
            ),
            CombinationResultGaugeRange(
              color: Colors.red.shade500.withOpacity(0.8),
              start: 40,
              end: 60,
              label: '50%',
            ),
            CombinationResultGaugeRange(
              color: Colors.red.shade800.withOpacity(0.8),
              start: 60,
              end: 80,
              label: '70%',
            ),
            CombinationResultGaugeRange(
              color: Colors.red.shade900.withOpacity(0.8),
              start: 80,
              end: 100,
              label: '90%',
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: percent!,
              enableAnimation: true,
              animationDuration: 4000,
            )
          ],
        ),
      ],
    );
  }
}
