def verify_mail_settings_screen_is_showing
  check_element_exists( "navigationItemView marked:'Settings'" )
  check_element_exists "view view:'UILabel' marked:'Mail Settings'"
end

def verify_mail_composer_screen_is_showing
  # Note: Since IOS 6 it is no longer possible to inspect the
  #       sub-views within the MFMailComposeViewController view
  #       so all we can do is check that _UIRemoteView exists
  wait_until( :timeout => 5, :message => "waited to see mail composer view" ) {
    element_exists( "view:'_UIRemoteView'" )
  }
end