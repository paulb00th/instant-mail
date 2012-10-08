# Instant Mail

Simple iPhone application which allows you to send a quick note to yourself (or any preset recipient) with minimal fuss. As well as setting the recipient you can also set a default subject prefix to help with automatic filtering in your email client.

I would have liked to automatically open the IOS keyboard to reduce user action even further but this appears to be verboten since the release of IOS 6. It used to be possible to navigate the sub-views of the MFMailComposeViewController view to access the visible controls but this does not work since Apple started using a remote view 
which runs in a separate process. See http://oleb.net/blog/2012/10/remote-view-controllers-in-ios-6/ for further information on this new behaviour.

## Functional Tests

Functional tests are located in [instant-mail/Frank/features](instant-mail/Frank/features)
    
## License

Released under the MIT License. Please see the accompanying [LICENSE](LICENSE) document for details.
