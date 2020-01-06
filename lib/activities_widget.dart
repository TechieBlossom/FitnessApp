import 'dart:ui';

import 'package:fitness_app/activity_box_widget.dart';
import 'package:fitness_app/fitness_data.dart';
import 'package:fitness_app/graph.dart';
import 'package:fitness_app/hobbies_icons.dart';
import 'package:fitness_app/themes/colors.dart';
import 'package:flutter/material.dart';

class BottomLabel {
  static const String DAY = "Day";
  static const String WEEK = "Week";
  static const String MONTH = "Month";
}

class ActivitiesWidget extends StatefulWidget {
  final AnimationController _animationController;
  final double _screenHeight;

  ActivitiesWidget(this._animationController, this._screenHeight);

  @override
  _ActivitiesWidgetState createState() => _ActivitiesWidgetState();
}

class _ActivitiesWidgetState extends State<ActivitiesWidget> with SingleTickerProviderStateMixin {
  Animation<double> _activitiesOpenCloseAnimation;
  Animation<double> _fadeAnimation;

  AnimationController _graphAnimationController;
  String selectedHobby;
  String selectedDuration;
  List<GraphData> values;

  @override
  void initState() {
    super.initState();
    _graphAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(widget._animationController);

    _activitiesOpenCloseAnimation = Tween<double>(begin: widget._screenHeight, end: 120.0)
        .animate(CurvedAnimation(parent: widget._animationController, curve: Curves.decelerate));

    _activitiesOpenCloseAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _graphAnimationController.forward();
      }
      if (status == AnimationStatus.reverse) {
        _graphAnimationController.reverse();
      }
    });

    selectedHobby = Activities.CYCLING;
    selectedDuration = BottomLabel.WEEK;
    values = allStats[selectedHobby].statsMap[selectedDuration];
  }

  @override
  void dispose() {
    _graphAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, widget) {
        print("animated builder");
        return getActivitiesWidget(context);
      },
      animation: widget._animationController,
    );
  }

  void onHobbyTap(String hobbyTapped) async {
    await _graphAnimationController.reverse();
    setState(() {
      selectedHobby = hobbyTapped;
      values = allStats[selectedHobby].statsMap[selectedDuration];
    });
    _graphAnimationController.forward();
  }

  _buildTopLabels(List<GraphData> values) {
    return [values.elementAt(0), values.elementAt((values.length / 2).floor()), values.elementAt(values.length - 1)]
        .map((graphData) => Text(
              graphData.label,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ))
        .toList();
  }

  _buildBottomLabels() {
    return <Widget>[
      _buildBottomLabel("Day", BottomLabel.DAY),
      _buildBottomLabel("Week", BottomLabel.WEEK),
      _buildBottomLabel("Month", BottomLabel.MONTH),
    ];
  }

  _buildBottomLabel(String label, String bottomLabelType) {
    bool isSelected = selectedDuration == bottomLabelType;
    return InkWell(
      onTap: () async {
        if (mounted) {
          if (!isSelected) {
            await _graphAnimationController.reverse();
          }
          setState(() {
            if (!isSelected) {
              selectedDuration = bottomLabelType;
              values = allStats[selectedHobby].statsMap[selectedDuration];
            }
          });
          if (!isSelected) {
            _graphAnimationController.forward();
          }
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            width: isSelected ? 10 : 0,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget getActivitiesWidget(context) {
    var sum = values.reduce((a, b) => GraphData("sum", a.value + b.value));
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: _activitiesOpenCloseAnimation.value,
      height: widget._screenHeight - 120,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.9),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "ACTIVITIES",
                          style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ActivityBoxWidget(
                                  onHobbyTap: onHobbyTap,
                                  color: Colors.redAccent,
                                  icon: HobbiesIcons.swimming,
                                  hobby: Activities.SWIMMING,
                                ),
                                ActivityBoxWidget(
                                  onHobbyTap: onHobbyTap,
                                  color: Colors.teal,
                                  icon: HobbiesIcons.cycling,
                                  hobby: Activities.CYCLING,
                                ),
                                ActivityBoxWidget(
                                  onHobbyTap: onHobbyTap,
                                  color: Colors.lightBlueAccent,
                                  icon: HobbiesIcons.running,
                                  hobby: Activities.RUNNING,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ActivityBoxWidget(
                                  onHobbyTap: onHobbyTap,
                                  color: Colors.indigo,
                                  icon: HobbiesIcons.yoga,
                                  hobby: Activities.YOGA,
                                ),
                                ActivityBoxWidget(
                                  onHobbyTap: onHobbyTap,
                                  color: Colors.pinkAccent,
                                  icon: HobbiesIcons.dancing,
                                  hobby: Activities.DANCING,
                                ),
                                ActivityBoxWidget(
                                  onHobbyTap: onHobbyTap,
                                  color: Colors.cyan,
                                  icon: HobbiesIcons.gym,
                                  hobby: Activities.GYM,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    sum.value.toString(),
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32.0),
                                  ),
                                  Text(
                                    "Steps",
                                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20.0),
                                  ),
                                ],
                              ),
                              FlatButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.show_chart,
                                  color: Colors.indigo,
                                ),
                                label: Text(
                                  selectedHobby,
                                  style: TextStyle(color: Colors.indigo, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _buildTopLabels(values),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: Graph(
                              graphAnimationController: _graphAnimationController,
                              values: values,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _buildBottomLabels(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
