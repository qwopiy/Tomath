import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/widget/woodbutton.dart';
import '../service/app_state_provider.dart';

class DialogueInputName extends StatelessWidget {
  final String buttonText;

  const DialogueInputName({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final appState = Provider.of<AppStateProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: keyboardHeight > 0
              ? keyboardHeight + 16
              : 32,
          left: 16,
          right: 16,
        ),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 600, // 🔥 kunci tablet
          ),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 🔥 kunci overflow
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/ui/kertasPipih.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'BaskervvilleSC',
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "INPUT USERNAME",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'BaskervvilleSC',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: WoodButton(
                  text: buttonText,
                  onTap: () {
                    appState.setUsername(controller.text);
                    appState.nextDialog();
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
