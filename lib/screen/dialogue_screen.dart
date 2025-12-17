import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


import '../service/app_state_provider.dart';
import '../service/audio_provider.dart';
import '../widget/DialogeInputName.dart';
import '../widget/Dialogue.dart';

class DialogueScreen extends StatefulWidget {
  const DialogueScreen({super.key});

  @override
  State<DialogueScreen> createState() => _DialogueScreenState();
}

class _DialogueScreenState extends State<DialogueScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AudioProvider>().playBgm(AppMusic.homeTheme);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          Widget content;
          final String? action = appState.currentDialog?.action;
          Future<void> _isLoading(String? action) async {
            if(action == 'loading') {
              await Future.delayed(const Duration(seconds: 1));
              appState.nextDialog();
            }
            return;
          }

          _isLoading(action);
          if (action == 'input_username') {
            content = DialogueInputName(
                buttonText: 'confirm',
            );
          } else {
            content = Dialogue(
                buttonText: 'next',
                textContent: appState.getProcessedDialogue(),
                onTap: (){
                  if (action == 'navigate_toCampaign') {
                      context.go("/campaign");
                    print("Event Quest Dipicu!");
                  }else if (action == 'navigate_toHome'){
                      context.go("/home");
                  }
                  appState.nextDialog();
                },
            );
          }

          return Scaffold(
            backgroundColor: const Color(0xffe8b882),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background/HomeBG.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(child: content),
            ),
          );
        }
    );
  }
}