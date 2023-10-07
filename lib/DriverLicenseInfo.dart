import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DriverLicenseInfo extends StatefulWidget {
  @override
  _DriverLicenseInfoState createState() => _DriverLicenseInfoState();
}

class _DriverLicenseInfoState extends State<DriverLicenseInfo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'I2Rd8z_VHpE', // Video ID from your YouTube link
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver License in Canberra"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
            SizedBox(height: 16),
            Text(
              "Steps to get your Driver License in Canberra:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[700],
              ),
            ),
            SizedBox(height: 16),
            _buildStep(1, "Register for a learner's permit."),
            _buildStep(2, "Complete mandatory driving hours."),
            _buildStep(3, "Pass the driving test."),
            _buildStep(4, "Apply for the provisional license."),
            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }

  Widget _buildStep(int stepNumber, String step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            "$stepNumber.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              step,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
