import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/sub_bab_model.dart';
import '../service/app_state_provider.dart';
import 'level_button.dart';
import 'level_popup.dart';

class LevelMapArea extends StatefulWidget {
  final BoxConstraints constraints;

  const LevelMapArea({
    super.key,
    required this.constraints,
  });

  @override
  State<LevelMapArea> createState() => _LevelMapAreaState();
}

class _LevelMapAreaState extends State<LevelMapArea> {

  void _openPopup(int _level, SubBabModel _subBab) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (_) => LevelPopup(level: _level, subBab: _subBab),
    );
  }

  bool isEnabled(int is_playable){
    if(is_playable == 1){
      return true;
    }else{
      return false;
    }
  }


  List<Widget> asignSubBabButton(BuildContext context, double w, double h) {
    final appState = Provider.of<AppStateProvider>(context, listen: true);
    final positions = appState.currentButtonCampaignPos;
    List<SubBabModel> subBabList = appState.subBabList;

    if (positions.isEmpty || positions.length != subBabList.length) {
      return [];
    }

    List<Widget> positionedButtons = [];

    for (int i= 0; i < subBabList.length; i++) {
      final pos = positions[i];

      final subBab = subBabList[i];
      bool enabled = isEnabled(subBab.is_playable);
      print(enabled);

      positionedButtons.add(
        Positioned(
          top: h * pos.top,
          right: w * pos.right,
          child: LevelButton(
            enabled: enabled,
            onTap: (){
              print('SubBab Index: $i,  ditekan');
              _openPopup((i + 1), subBab);
            },
          ),
        ),
      );
    }

    return positionedButtons;
  }


  @override
  Widget build(BuildContext context) {
    double w = widget.constraints.maxWidth;
    double h = widget.constraints.maxHeight;

    return SizedBox(
      height: h * 0.50,
      child: Row(
        children: [
          Expanded(child: Container()),

          SizedBox(
            width: w * 0.7,
            child: Stack(
              children: [
                ...asignSubBabButton(context, w, h),
              ],
            ),
          ),

          Expanded(child: Container()),
        ],
      ),
    );
  }
}

