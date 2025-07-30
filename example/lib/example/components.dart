import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rainmakers_design_system/rainmakers_design_system.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({super.key, required this.onThemeChanged});
  final ValueChanged<RMThemeType> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const RMText.titleLarge('Design System')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RMText.titleMedium('Buttons'),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      RMElevatedButton.primary(
                        label: 'Modern B',
                        onPressed: () => onThemeChanged(RMThemeType.modern),
                      ),
                      const SizedBox(height: 8.0),
                      RMElevatedButton.primary(
                        isDisabled: true,
                        label: 'Modern B',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8.0),
                      RMElevatedButton.primary(
                        isLoading: true,
                        label: 'Modern B',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8.0),
                      RMTextButton.primary(
                        label: 'Corporate B',
                        onPressed: () => onThemeChanged(RMThemeType.corporate),
                      ),
                      const SizedBox(height: 8.0),
                      RMTextButton.primary(
                        enabled: false,
                        label: 'Especial B',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8.0),
                      RMIconButton.primary(
                        iconPath: RMAssets.iconWarning,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8.0),
                      RMIconButton.primary(
                        iconPath: RMAssets.iconWarning,
                        enabled: false,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    children: [
                      RMOutlinedButton.primary(
                        label: 'Minimal B',
                        onPressed: () => onThemeChanged(RMThemeType.minimal),
                      ),
                      const SizedBox(height: 8.0),
                      RMOutlinedButton.primary(
                        isDisabled: true,
                        label: 'Minimal B',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8.0),
                      RMOutlinedButton.primary(
                        isLoading: true,
                        label: 'Minimal B',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8.0),
                      RMTextButton.icon(
                        label: 'Especial B',
                        iconPath: RMAssets.iconWarning,
                        onPressed: () => onThemeChanged(RMThemeType.special),
                      ),
                      const SizedBox(height: 8.0),
                      RMTextButton.icon(
                        enabled: false,
                        label: 'Especial B',
                        iconPath: RMAssets.iconWarning,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              const RMText.titleMedium('Checkboxes'),
              const SizedBox(height: 8.0),
              RMCheckboxWidget(
                textCheckbox: 'Tap 2 Checkbox',
                value: true,
                onChanged: (value) {},
              ),
              RMCheckboxWidget(
                textCheckbox: 'Tap 2 Checkbox',
                value: false,
                onChanged: (value) {},
              ),
              RMCheckboxWidget(
                textCheckbox: 'Tap 2 Checkbox',
                value: true,
                enabled: false,
                onChanged: (value) {},
              ),
              RMCheckboxWidget(
                textCheckbox: 'Tap 2 Checkbox',
                value: false,
                enabled: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 8.0),
              RMCheckboxWidget(
                textCheckbox: 'Tap 2 Checkbox',
                value: false,
                onChanged: (value) {},
                errorText: 'Error message',
                showError: true,
              ),
              const SizedBox(height: 8.0),
              RMCheckboxWidget(
                textCheckbox: 'Tap 2 Checkbox',
                value: false,
                onChanged: (value) {},
                infoText: 'Info message',
              ),
              const SizedBox(height: 24.0),
              const RMText.titleMedium('Sliders'),
              const SizedBox(height: 8.0),
              RMSliderWidget(
                initialValue: 2,
                min: 0.0,
                max: 5.0,
                divisions: 5,
                onChanged: (value) {},
              ),
              const SizedBox(height: 24.0),
              const RMText.titleMedium('Switches'),
              const SizedBox(height: 8.0),
              RMSwitchWidget(
                text: 'Tap 2 Switch',
                value: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 8.0),
              RMSwitchWidget(
                text: 'Tap 2 Switch',
                value: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 8.0),
              RMSwitchWidget(
                text: 'Tap 2 Switch',
                value: true,
                enabled: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 8.0),
              RMSwitchWidget(
                text: 'Tap 2 Switch',
                value: false,
                enabled: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 24.0),
              const RMText.titleMedium('Tags'),
              const SizedBox(height: 8.0),
              RMTagIconWidget.fill(
                label: 'Tap 2 Tag',
                iconPath: RMAssets.iconWarning,
              ),
              const SizedBox(height: 8.0),
              RMTagIconWidget.outlined(
                label: 'Tap 2 Tag',
                iconPath: RMAssets.iconWarning,
              ),
              const SizedBox(height: 24.0),
              const RMText.titleMedium('Inputs'),
              const SizedBox(height: 8.0),
              RMTextFieldWidget(
                onChanged: (value) {},
                labelText: 'Tap 2 Input',
              ),
              const SizedBox(height: 8.0),
              RMTextFieldWidget(
                enabled: false,
                onChanged: (value) {},
                labelText: 'Tap 2 Input',
              ),
              const SizedBox(height: 8.0),
              RMTextFieldWidget(
                readOnly: true,
                onChanged: (value) {},
                labelText: 'Tap 2 Input',
              ),
              const SizedBox(height: 8.0),
              RMTextFieldWidget(
                showError: true,
                errorText: 'Error message',
                onChanged: (value) {},
                labelText: 'Tap 2 Input',
              ),
              const SizedBox(height: 8.0),
              RMTextFieldWidget(
                onChanged: (value) {},
                labelText: 'Tap 2 Input',
                infoText: 'Info message',
              ),
              const SizedBox(height: 8.0),
              RMCustomStatesTextFieldWidget(
                onChanged: (value) {},
                labelText: 'Tap 2 Input',
                onCompleted: (_) {},
                inputFormatters: [
                  IbanInputFormatter(),
                  LengthLimitingTextInputFormatter(28),
                ],
              ),
              const SizedBox(height: 8.0),
              RMCustomStatesTextFieldWidget(
                onChanged: (value) {},
                labelText: 'Tap 2 Input',
                onCompleted: (_) {},
                isLoading: true,
                inputFormatters: [
                  IbanInputFormatter(),
                  LengthLimitingTextInputFormatter(28),
                ],
              ),
              const SizedBox(height: 8.0),
              RMCustomStatesTextFieldWidget(
                onChanged: (value) {},
                labelText: 'Tap 2 Input',
                onCompleted: (_) {},
                isAccepted: true,
                inputFormatters: [
                  IbanInputFormatter(),
                  LengthLimitingTextInputFormatter(28),
                ],
              ),
              const SizedBox(height: 8.0),
              RMDropdownFieldWidget<String>(
                title: 'Select Language',
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: RMText.bodyMedium('English'),
                  ),
                  DropdownMenuItem(
                    value: 'es',
                    child: RMText.bodyMedium('Spanish'),
                  ),
                ],
                onChanged: (value) {},
                initialValue: 'es',
              ),
              const SizedBox(height: 8.0),
              RMCodeFieldWidget(onCompleted: (p0) {}),

              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
