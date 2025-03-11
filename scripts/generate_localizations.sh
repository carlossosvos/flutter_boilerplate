
# Navigate to the project root directory
cd "$(dirname "$0")/../.."

# Run the intl_utils generate command
flutter pub run intl_utils:generate

echo "Localization files generated successfully."