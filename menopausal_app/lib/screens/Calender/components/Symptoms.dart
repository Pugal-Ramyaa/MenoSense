// SymptomsComponent.dart
import 'package:flutter/material.dart';
import 'package:menopausal_app/constants.dart';

class SymptomsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
                  SymptomRankingWidget(
                    symptom: 'Sleeping Problems',
                    imageAsset: 'Assets/Images/insomnia.png',
                    information: 'Sleeping problems affect the normal sleep patterns of individuals. These problems can lead to difficulties falling asleep, staying asleep, or experiencing restorative sleep. ',
                  ),
                  SizedBox(height: 30),
                  SymptomRankingWidget(
                    symptom: 'Hot Flashes',
                    imageAsset: 'Assets/Images/hot-flashes.png',
                    information: 'A hot flash is a feeling of sudden, intense heat on the upper body that lasts anywhere from 30 seconds to several minutes.',
                  ),
                  SizedBox(height: 30),
                  SymptomRankingWidget(
                    symptom: 'Night Sweats',
                    imageAsset: 'Assets/Images/sweats.png',
                    information: 'Night sweats, also known as sleep hyperhidrosis, refer to episodes of excessive sweating during sleep. These episodes can lead to damp sleepwear and bed linens, and they may disrupt a person sleep. ',
                  ),
                  SizedBox(height: 30),
                  SymptomRankingWidget(
                    symptom: 'Chills',
                    imageAsset: 'Assets/Images/chills.png',
                    information: 'Chills refer to the sensation of feeling cold, often accompanied by shivering or shaking. ',
                  ),
                  SizedBox(height: 30),
                  SymptomRankingWidget(
                    symptom: 'Fatigue',
                    imageAsset: 'Assets/Images/dizziness.png',
                    information: 'Fatigue is a term used to describe a feeling of extreme tiredness, weakness, or exhaustion that can be physical, mental, or both. ',
                  ),
                  SizedBox(height: 30),
                  SymptomRankingWidget(
                    symptom: 'Head Ache',
                    imageAsset: 'Assets/Images/migraine.png',
                    information: 'A headache is a pain or discomfort in the head or upper neck.',
                  ),
                  SizedBox(height: 30),
                  SymptomRankingWidget(
                    symptom: 'Vaginal Dryness',
                    imageAsset: 'Assets/Images/menopause.png',
                    information: 'Vaginal dryness is a condition characterized by a lack of moisture and lubrication in the vagina. It occurs when the natural lubrication produced by the vaginal walls decreases. This can lead to discomfort, itching, and pain.',
                  ),
                  SizedBox(height: 30),
                  SymptomRankingWidget(
                    symptom: 'Mood Swings',
                    imageAsset: 'Assets/Images/mood-swings.png',
                    information: 'Mood swings refer to abrupt and often unpredictable changes in a person emotional state or mood. These fluctuations can involve shifts between various emotions, such as happiness, sadness, anger, or irritability. ',
                  ),
                  // Add more SymptomRankingWidgets for additional symptoms
                ],
      ),
    );
  }
}

class SymptomRankingWidget extends StatefulWidget {
  final String symptom;
  final String imageAsset;
  final String information;

  SymptomRankingWidget({
    required this.symptom,
    required this.imageAsset,
    required this.information,
  });


  @override
  _SymptomRankingWidgetState createState() => _SymptomRankingWidgetState();
}

class _SymptomRankingWidgetState extends State<SymptomRankingWidget> {
  int selectedRating = 0;

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.symptom),
          content: Text(
            widget.information,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            // Logo on the left corner
            Image.asset(
              widget.imageAsset, // Replace with your logo asset path
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            // Symptom name
            Text(
              widget.symptom,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            // Information logo on the right corner
            GestureDetector(
              onTap: _showInfoDialog,
              child: Container(
                width: 30,
                height: 30,
                child: Center(
                  child: Icon(
                    Icons.info,
                    color: kPrimaryColor, // Replace with your desired icon color
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: List.generate(
            10,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedRating = index + 1;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < selectedRating
                      ? kPrimaryLightColor
                      : Colors.transparent,
                  border: Border.all(
                    color: kPrimaryLightColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
