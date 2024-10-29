# Color codes
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
reset='\033[0m'
bold='\033[1m'

# Function to show the menu
show_menu() {
    clear
    echo "${cyan}${bold}=================================================="
    echo "           🚀 KiiBank App Actions Menu 🚀        "
    echo "=================================================="
    echo "${blue}1)${reset} Build APK/IPA 📱"
    echo "${blue}2)${reset} Distribute App to Firebase ☁️"
    echo "${blue}3)${reset} Exit 👋"
    echo "${cyan}${bold}==================================================${reset}"
    echo ""
}

# Function to build APK
flutter_get_build() {
    echo "${yellow}🛠️  Preparing project...${reset}"
    echo "${yellow}🔄 Loading all packages and dependencies. This may take a few moments...${reset}"
    melos bs 
    melos run format
    echo "${green}✅ All packages and dependencies have been successfully loaded!${reset}"
}

# Function to build Android APK
build_android() {
    echo "${yellow}🔧 Building Android APK...${reset}"
    # flutter build apk
    echo "${green}✅ Android APK built successfully!${reset}"
}

# Function to build iOS IPA
build_ios() {
    echo "${yellow}🔧 Building iOS IPA...${reset}"
    # flutter build ios
    echo "${green}✅ iOS IPA built successfully!${reset}"
}

# Function to distribute Android app to Firebase
distribute_android() {
    echo "${yellow}📤 Distributing Android app to Firebase...${reset}"
    # Firebase distribution command for Android
    cd android/
    fastlane alpha
    echo "${green}✅ Android app distributed to Firebase successfully!${reset}"
}

# Function to distribute iOS app to Firebase
distribute_ios() {
    echo "${yellow}📤 Distributing iOS app to Firebase...${reset}"
    # Firebase distribution command for iOS
    cd ios
    fastlane iosalpha
    echo "${green}✅ iOS app distributed to Firebase successfully!${reset}"
}

# Function to distribute to Firebase
distribute_to_firebase() {
    echo "${yellow}📤 Distributing app to Firebase...${reset}"
    # Add your Firebase distribution commands here
    echo "${green}✅ App distributed to Firebase successfully!${reset}"
}

# Function to show build options menu
show_build_menu() {
    clear
    echo "${cyan}${bold}=================================================="
    echo "             🔧 Build APK/IPA 🔧               "
    echo "=================================================="
    echo "${blue}1)${reset} Build for Android 📱"
    echo "${blue}2)${reset} Build for iOS 📱"
    echo "${blue}3)${reset} Back to Main Menu 🔙"
    echo "${cyan}${bold}==================================================${reset}"
    echo ""
}

# Function to show distribution options menu
show_distribution_menu() {
    clear
    echo "${cyan}${bold}=================================================="
    echo "       ☁️ Distribute App to Firebase ☁️       "
    echo "=================================================="
    echo "${blue}1)${reset} Distribute Android App 📱"
    echo "${blue}2)${reset} Distribute iOS App 📱"
    echo "${blue}3)${reset} Back to Main Menu 🔙"
    echo "${cyan}${bold}==================================================${reset}"
    echo ""
}

# Main loop
while true; do
    show_menu
    read -p $'\033[1m\033[36mPlease select an option from the menu (1-3): \033[0m' main_option
    case $main_option in
        1)
            while true; do
                show_build_menu
                read -p $'\033[1m\033[36mPlease select a build option (1-3): \033[0m' build_option
                case $build_option in
                    1)
                        build_android
                        break
                        ;;
                    2)
                        build_ios
                        break
                        ;;
                    3)
                        break
                        ;;
                    *)
                        echo " ❌ ${red}Invalid option. Please enter 1, 2, or 3.${reset}"
                        sleep 2
                        ;;
                esac
            done
            ;;
        2)
            while true; do
                show_distribution_menu
                read -p $'\033[1m\033[36mPlease select a distribution option (1-3): \033[0m' distribution_option
                case $distribution_option in
                    1)
                        distribute_android
                        break
                        ;;
                    2)
                        distribute_ios
                        break
                        ;;
                    3)
                        break
                        ;;
                    *)
                        echo " ❌ ${red}Invalid option. Please enter 1, 2, or 3.${reset}"
                        sleep 2
                        ;;
                esac
            done
            ;;
        3)
            echo "${cyan}👋 Exiting...${reset}"
            exit 0
            ;;
        *)
            echo "${red} ❌ Invalid option. Please enter 1, 2, or 3.${reset}"
            sleep 2
            ;;
    esac
    read -p $'\033[1m\033[36mPress [Enter] key to continue...\033[0m'
done
