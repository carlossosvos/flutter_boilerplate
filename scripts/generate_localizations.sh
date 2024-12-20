# filepath: /Users/cgcasco/development/mystufff/flutter_boilerplate/scripts/generate_localizations.sh
#!/bin/bash

# Navigate to the project root directory
cd "$(dirname "$0")/../.."

# Run the intl_utils generate command
flutter pub run intl_utils:generate

echo "Localization files generated successfully."