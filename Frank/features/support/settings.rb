def type_into_settings_text_field(text_to_type, label_name)
  text_field_selector = "view:'UILabel' marked:'Recipient' parent tableViewCell view:'IASKTextField'"
  check_element_exists( text_field_selector )
  touch( text_field_selector )
  send_command(text_to_type)
end

def send_command ( command )
  %x{osascript<<APPLESCRIPT
  tell application "System Events"
  tell application "iPhone Simulator" to activate
  keystroke "#{command}"
  delay 1
  key code 36
  end tell
  APPLESCRIPT}
end
