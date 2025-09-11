#!/bin/bash

echo ' 
 _   _ _   _            _______   ___   _ _____ 
| \ | | | | |          /  ___\ \ / / \ | /  __ \
|  \| | | | |  ______  \ `--. \ V /|  \| | /  \/
| . ` | | | | |______|  `--. \ \ / | . ` | |    
| |\  \ \_/ /          /\__/ / | | | |\  | \__/\
\_| \_/\___/           \____/  \_/ \_| \_/\____/
                                                
                                                '

echo -e "1. Backup\n2. Restore\n3. Quit \n"                                               
option=0

while [[ $option -ne 3 ]]; do
  
  read -p "Chose Option : " option
  if [[ $option == "1" ]]; then
    echo -e "\n -- Backup -- \n"
    
    read -p "Confirm (it will override default backups config/data) y/n? " confirm
    if [[ "$confirm" == "y" || "$confirm" == "yes" ]]; then
      echo -e "\nBacking Up Started ...\n"
    else
      echo -e "\nBacking Up Cancelled!\n"
      continue
    fi
    if rm -rf ./configs.tar.gz ./data_plugins.tar.gz; then
      echo "✅ Old Neovim backup removed."
    else
       echo "❌ Failed to remove old Neovim backups"
       break
    fi
    if tar -czf ./configs.tar.gz -C ~/.config nvim; then
      echo "✅ Neovim config backup successfull."
    else
      echo "❌ Failed to backup Neovim config."
      break
    fi

    if tar -czf ./data_plugins.tar.gz \
    --exclude='nvim/mason' \
    --exclude='nvim/lazy' \
    --exclude='nvim/site' \
    -C ~/.local/share nvim; then
      echo -e "✅ Neovim data plugins backup successfull.\n"
      break
    else
      echo "❌ Failed to backup Neovim data plugins."
      break
    fi

  elif [[ $option == "2" ]]; then
    echo -e "\n -- Restore -- \n"
    read -p "Confirm (it will override default nvim config/data) y/n? " confirm
    if [[ "$confirm" == "y" || "$confirm" == "yes" ]]; then
      echo -e "\nRestoring Started ...\n"
    else
      echo -e "\nRestoring Cancelled!\n"
      continue
    fi

# Remove old nvim directories
    if rm -rf ~/.config/nvim ~/.local/share/nvim; then
      echo "✅ Old Neovim directories removed."
    else
      echo "❌ Failed to remove old Neovim directories."
      break
    fi

# 3. Move new config
    if tar -xf ./configs.tar.gz -C ~/.config; then
      echo "✅ Neovim config installed."
    else
      echo "❌ Failed to install Neovim config."
      break
    fi

#  Move new data_plugins
    if tar -xf ./data_plugins.tar.gz -C ~/.local/share; then
      echo -e "✅ Neovim data plugins installed.\n"
      break
    else
      echo "❌ Failed to install Neovim data plugins."
      break
    fi
  elif [[ $option == "3" ]]; then
    echo -e "\nExiting ...\n"
    break
  else
    echo -e "\nInvalid Option! Try again?\n"
  fi

done
