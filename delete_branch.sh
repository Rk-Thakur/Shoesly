
# #!/bin/bash

# # Define your branches here
# branches=("testing" 'testing1' 'testing2' 'testing4' 'testing5')

# # Log file location
# log_file="operation_log.log"

# # Function to write logs with date and time
# log_message() {
#   echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
# }

# # Function to print success message with a green tick
# success_message() {
#   message="✅ $1"
#   echo " \033[0;32m$message\033[0m"
#   log_message "$message"
# }

# # Function to print error message
# error_message() {
#   message="❌ $1"
#   echo  " \033[0;31m$message\033[0m"
#   log_message "$message"
# }

# # Function to display a progress bar
# progress_bar() {
#   local completed=$1
#   local total=$2
#   local width=50 # Progress bar width
#   local percent=$((completed * 100 / total))
#   local filled=$((percent * width / 100))
#   local empty=$((width - filled))

#   printf "\rProgress: [\033[0;32m%0.s#\033[0m%0.s-] %d%%" $(seq 1 $filled) $(seq 1 $empty) $percent
# }

# # Log the start of the operation
# log_message "====================================="
# log_message "Starting branch deletion operation..."
# log_message "====================================="

# # Confirm deletion with the user
# echo "The following branches will be checked and deleted if they exist:"
# for branch in "${branches[@]}"; do
#   echo "- $branch"
# done

# read -p "Are you sure you want to proceed? (y/n): " confirm
# if [[ "$confirm" != "y" ]]; then
#   echo "Operation cancelled."
#   log_message "Operation cancelled by user."
#   exit 0
# fi

# # Loop through each branch with a progress indicator
# total_branches=${#branches[@]}
# completed=0
# deleted_count=0
# failed_count=0

# for branch in "${branches[@]}"; do
#   # Increment progress
#   ((completed++))
#   progress_bar $completed $total_branches

#   # Check if the branch exists on the remote
#   if git ls-remote --heads origin "$branch" > /dev/null; then
#     # Delete the branch and suppress error output
#     if git push origin --delete "$branch" 2>/dev/null; then
#       success_message "Deleted branch '$branch'"
#       ((deleted_count++))
#     else
#       error_message "Failed to delete branch '$branch'"
#       ((failed_count++))
#     fi
#   else
#     error_message "Branch '$branch' does not exist"
#     ((failed_count++))
#   fi
# done

# # Final message and summary
# echo "\n====================================="
# echo "All operations completed."
# echo "Deleted: $deleted_count | Failed: $failed_count"
# echo "====================================="

# log_message "====================================="
# log_message "All operations completed."
# log_message "Deleted branches: $deleted_count | Failed: $failed_count"
# log_message "====================================="




#!/bin/bash

# Log file location
log_file="operation_log.log"

# Function to write logs with date and time
log_message() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

# Function to print success message with a green tick
success_message() {
  message="✅ $1"
  echo " \033[0;32m$message\033[0m"
  log_message "$message"
}

# Function to print error message
error_message() {
  message="❌ $1"
  echo  " \033[0;31m$message\033[0m"
  log_message "$message"
}

# Function to display a progress bar
progress_bar() {
  local completed=$1
  local total=$2
  local width=50 # Progress bar width
  local percent=$((completed * 100 / total))
  local filled=$((percent * width / 100))
  local empty=$((width - filled))

  printf "\rProgress: [\033[0;32m%0.s#\033[0m%0.s-] %d%%" $(seq 1 $filled) $(seq 1 $empty) $percent
}

# Fetch all remote branches
remote_branches=($(git branch -r | grep -v '\->' | sed 's/origin\///'))

# Create a string to pass to dialog
branch_list=""
for branch in "${remote_branches[@]}"; do
  branch_list+="$branch\n"
done

# Ask the user to select branches to delete using dialog
selected_branches=$(echo -e "$branch_list" | dialog --checklist "Select branches to delete (Use spacebar to select, arrow keys to navigate)" 15 50 5)

# Convert the selected branches into an array
IFS=' ' read -r -a selected_branches <<< "$selected_branches"

# Display the selected branches
echo "You have selected the following branches for deletion:"
for branch in "${selected_branches[@]}"; do
  echo "- $branch"
done

# Confirm deletion with the user
read -p "Are you sure you want to delete the selected branches? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
  echo "Operation cancelled."
  log_message "Operation cancelled by user."
  exit 0
fi

# Log the start of the operation
log_message "====================================="
log_message "Starting branch deletion operation..."
log_message "====================================="

# Loop through each selected branch with a progress indicator
total_branches=${#selected_branches[@]}
completed=0
deleted_count=0
failed_count=0

for branch in "${selected_branches[@]}"; do
  # Increment progress
  ((completed++))
  progress_bar $completed $total_branches

  # Ensure there are no empty branches due to parsing issues
  if [[ -z "$branch" ]]; then
    continue
  fi

  # Check if the branch exists on the remote
  if git ls-remote --heads origin "$branch" > /dev/null; then
    # Delete the branch and suppress error output
    if git push origin --delete "$branch" 2>/dev/null; then
      success_message "Deleted branch '$branch'"
      ((deleted_count++))
    else
      error_message "Failed to delete branch '$branch'"
      ((failed_count++))
    fi
  else
    error_message "Branch '$branch' does not exist"
    ((failed_count++))
  fi
done

# Final message and summary
echo -e "\n====================================="
echo "All operations completed."
echo "Deleted: $deleted_count | Failed: $failed_count"
echo "====================================="

log_message "====================================="
log_message "All operations completed."
log_message "Deleted branches: $deleted_count | Failed: $failed_count"
log_message "====================================="
