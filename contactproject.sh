#!/bin/bash
#Hello, This is the Contact management program by Anish K. Mahato ;-)
filename="contacts.txt"

add_contact() {
  read -p "Enter the name of the contact: " name
  read -p "Enter the phone number: " number

  echo "$name $number" >> $filename
  echo "Contact added."
}

show_contacts() {
  echo "Contacts:"
  cat $filename
}

search_contact() {
  read -p "Enter the name of the contact: " name

  found=$(grep -w "$name" $filename)
  if [ -z "$found" ]; then
    echo "Contact not found."
  else
    echo "Contact found:"
    echo "$found"
  fi
}


edit_contact() {
  read -p "Enter the name of the contact: " name
 
  found=$(grep -w "$name" $filename)
  if [ -z "$found" ]; then
    echo "Contact not found."
  else
    # Read the new phone number
    read -p "Enter the new phone number: " number

    # Replace the line containing the contact
    sed -i "/$name/c\\$name $number" $filename
    echo "Contact updated."
  fi
}

delete_contact() {
  read -p "Enter the name of the contact: " name

  found=$(grep -w "$name" $filename)
  if [ -z "$found" ]; then
    echo "Contact not found."
  else
    sed -i "/$name/d" $filename
    echo "Contact deleted."
  fi
}

# Show menu
while true; do
  echo "1. Add a new contact"
  echo "2. Show all contacts"
  echo "3. Search for a contact"
  echo "4. Edit a contact"
  echo "5. Delete a contact"
  echo "6. Exit"
  read -p "Enter your choice (1-6): " choice

  case $choice in
    1) add_contact;;
    2) show_contacts;;
    3) search_contact;;
    4) edit_contact;;
    5) delete_contact;;
    6) exit 0;;
    *) echo "Invalid choice";;
  esac
done
 
