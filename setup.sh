#!/bin/bash

# =============================================================================
# macOS Dotfiles Setup Script
# =============================================================================
# This script manages the installation and uninstallation of development tools,
# applications, and utilities via Homebrew for macOS systems.
#
# Usage:
#   ./setup.sh                    # Install all packages
#   ./setup.sh --uninstall       # Uninstall specified packages
#   ./setup.sh --help            # Show help information
#
# Requirements:
#   - macOS
#   - Homebrew installed (https://brew.sh)
# =============================================================================

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# =============================================================================
# Helper Functions
# =============================================================================

print_header() {
    echo -e "${BLUE}==============================================================================${NC}"
    echo -e "${BLUE} $1 ${NC}"
    echo -e "${BLUE}==============================================================================${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if Homebrew is installed
check_homebrew() {
    if ! command -v brew &> /dev/null; then
        print_error "Homebrew is not installed. Please install it first:"
        print_info "Visit https://brew.sh for installation instructions"
        exit 1
    fi
}

# Confirm action with user
confirm_action() {
    local action="$1"
    echo -e "${YELLOW}Are you sure you want to $action? (y/N)${NC}"
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            return 0
            ;;
        *)
            print_info "Operation cancelled."
            exit 0
            ;;
    esac
}

# =============================================================================
# Package Definitions
# =============================================================================

# Development Tools
DEVELOPMENT_PACKAGES=(
    "nvim"              # Modern text editor
    "micro"             # Simple terminal editor
    "gh"                # GitHub CLI
    "git"               # Version control
    "rust"              # Rust programming language
    "php"               # PHP programming language
    "deno"              # JavaScript/TypeScript runtime
    "flutter"           # Mobile app framework
    "hugo"              # Static site generator
    "npm"               # Node package manager
    "solidity"          # Ethereum smart contract language
    "pybind11"          # Python C++ bindings
    "arduino-cli"       # Arduino command line interface
    "watchman"          # File watching service
)

DEVELOPMENT_CASKS=(
    "cursor"            # AI-powered code editor
    "vscodium"          # Open source VS Code
    "vscodium@insiders" # VS Code insiders
    "visual-studio-code" # Microsoft VS Code
    "code-server"       # VS Code in browser
    "neovide"           # Neovim GUI
    "emacs"             # Emacs editor
    "arduino-ide"       # Arduino IDE
    "godot"             # Game engine
    "blender"           # 3D modeling software
)

# System & Productivity Tools
SYSTEM_PACKAGES=(
    "tree"              # Directory tree viewer
    "wget"              # File downloader
    "fswatch"           # File system watcher
    "qemu"              # Virtual machine emulator
    "fish"              # Friendly shell
)

SYSTEM_CASKS=(
    "karabiner-elements" # Keyboard customizer
    "aerospace"         # Tiling window manager
    "alt-tab"           # Windows-style Alt-Tab
    "loop"              # Window management
    "macs-fan-control"  # Fan speed control
    "wacom-tablet"      # Wacom tablet driver
)

# Media & Communication
MEDIA_PACKAGES=(
    "mpv"               # Media player
    "signal"            # Secure messaging
)

MEDIA_CASKS=(
    "firefox"           # Web browser
    "opera-gx"          # Gaming browser
    "google-chrome"     # Google's browser
    "microsoft-edge@dev" # Edge dev channel
    "zen-browser"       # Privacy-focused browser
    "discord"           # Gaming/community chat
    "microsoft-teams"   # Business communication
    "obs"               # Screen recording
    "streamlabs"        # Streaming software
)

# Development & Virtualization
VIRTUALIZATION_PACKAGES=(
    "docker"            # Containerization
    "colima"            # Docker runtime for macOS
)

VIRTUALIZATION_CASKS=(
    "utm"               # Virtual machines
    "parallels"         # Windows virtualization
)

# Productivity & Office
PRODUCTIVITY_CASKS=(
    "obsidian"          # Note taking
    "libreoffice"       # Office suite
    "inkscape"          # Vector graphics
    "webull"            # Trading platform
)

# Terminal & CLI Tools
TERMINAL_PACKAGES=(
    "alacritty"         # GPU-accelerated terminal
    "kitty"             # Fast terminal emulator
    "zellij"            # Terminal multiplexer
    "ranger"            # File manager
)

TERMINAL_CASKS=(
    "tabby"             # Terminal emulator
    "ghostty"           # Modern terminal
)

# AI & Machine Learning
AI_PACKAGES=(
    "chatgpt"           # ChatGPT CLI
)

AI_CASKS=(
    "ollama"            # Local AI models
    "gpt4all"           # Local AI assistant
    "anaconda-navigator" # Data science platform
)

# Cloud & DevOps
CLOUD_PACKAGES=(
    "azure-cli"         # Azure command line
)

# Security & Privacy
SECURITY_PACKAGES=(
    "rustdesk"          # Remote desktop
)

# LaTeX & Documentation
LATEX_CASKS=(
    "mactex"            # LaTeX distribution
)

# SDL Development Libraries
SDL_PACKAGES=(
    "sdl2"              # Simple DirectMedia Layer
    "sdl2_ttf"          # SDL2 TrueType font library
)

# =============================================================================
# Installation Functions
# =============================================================================

install_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        print_info "Installing $package..."
        if brew install "$package"; then
            print_success "Installed $package"
        else
            print_error "Failed to install $package"
        fi
    done
}

install_casks() {
    local casks=("$@")
    for cask in "${casks[@]}"; do
        print_info "Installing $cask..."
        if brew install --cask "$cask"; then
            print_success "Installed $cask"
        else
            print_error "Failed to install $cask"
        fi
    done
}

install_all() {
    print_header "Installing Development Packages"
    install_packages "${DEVELOPMENT_PACKAGES[@]}"
    
    print_header "Installing Development Applications"
    install_casks "${DEVELOPMENT_CASKS[@]}"
    
    print_header "Installing System Tools"
    install_packages "${SYSTEM_PACKAGES[@]}"
    install_casks "${SYSTEM_CASKS[@]}"
    
    print_header "Installing Media & Communication Tools"
    install_packages "${MEDIA_PACKAGES[@]}"
    install_casks "${MEDIA_CASKS[@]}"
    
    print_header "Installing Virtualization Tools"
    install_packages "${VIRTUALIZATION_PACKAGES[@]}"
    install_casks "${VIRTUALIZATION_CASKS[@]}"
    
    print_header "Installing Productivity Applications"
    install_casks "${PRODUCTIVITY_CASKS[@]}"
    
    print_header "Installing Terminal Tools"
    install_packages "${TERMINAL_PACKAGES[@]}"
    install_casks "${TERMINAL_CASKS[@]}"
    
    print_header "Installing AI & ML Tools"
    install_packages "${AI_PACKAGES[@]}"
    install_casks "${AI_CASKS[@]}"
    
    print_header "Installing Cloud & DevOps Tools"
    install_packages "${CLOUD_PACKAGES[@]}"
    
    print_header "Installing Security Tools"
    install_packages "${SECURITY_PACKAGES[@]}"
    
    print_header "Installing LaTeX Tools"
    install_casks "${LATEX_CASKS[@]}"
    
    print_header "Installing SDL Libraries"
    install_packages "${SDL_PACKAGES[@]}"
    
    print_success "All packages installed successfully!"
}

# =============================================================================
# Uninstallation Functions
# =============================================================================

uninstall_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        print_info "Uninstalling $package..."
        if brew uninstall "$package" 2>/dev/null; then
            print_success "Uninstalled $package"
        else
            print_warning "$package was not installed or failed to uninstall"
        fi
    done
}

uninstall_casks() {
    local casks=("$@")
    for cask in "${casks[@]}"; do
        print_info "Uninstalling $cask..."
        if brew uninstall --cask "$cask" 2>/dev/null; then
            print_success "Uninstalled $cask"
        else
            print_warning "$cask was not installed or failed to uninstall"
        fi
    done
}

uninstall_specified() {
    print_header "Uninstalling Specified Packages"
    
    # Uninstall the packages that were listed in the original uninstall function
    local packages_to_remove=(
        "firefox" "opera-gx" "tabby" "microsoft-edge@dev" "ghostty" "gpt4all"
        "zellij" "blender" "aerospace" "wacom-tablet" "emacs" "ollama"
        "vscodium" "vscodium@insiders" "loop" "visual-studio-code" "code-server"
        "hugo" "deno" "flutter" "alt-tab" "mactex" "anaconda-navigator"
        "godot" "streamlabs" "obs"
    )
    
    local special_packages=("karabiner-elements" "sdl2" "sdl2_ttf")
    
    uninstall_casks "${packages_to_remove[@]}"
    uninstall_packages "${special_packages[@]}"
    
    print_success "Specified packages uninstalled!"
}

# =============================================================================
# Main Script Logic
# =============================================================================

show_help() {
    echo "macOS Dotfiles Setup Script"
    echo ""
    echo "Usage:"
    echo "  $0                    Install all packages"
    echo "  $0 --uninstall       Uninstall specified packages"
    echo "  $0 --help           Show this help message"
    echo ""
    echo "This script manages Homebrew packages and casks for your development environment."
}

main() {
    # Check if Homebrew is installed
    check_homebrew
    
    case "${1:-}" in
        --uninstall)
            confirm_action "uninstall the specified packages"
            uninstall_specified
            ;;
        --help|-h)
            show_help
            ;;
        "")
            confirm_action "install all packages"
            install_all
            ;;
        *)
            print_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"
