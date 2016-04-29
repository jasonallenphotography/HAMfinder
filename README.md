# HAMFinder

## About HAMFinder

This is an application designed and coded by myself while attending [Dev Bootcamp](http://devbootcamp.com/) across 24 hours from scratch to MVP.

## Goals:

* Create a user-authenticated, Sinatra-driven application to retrieve 2m-band amateur radio repeaters within a 50 mile range of a user's saved locations, and return that information to the user in a format that they can download direct to a handheld or fixed-station HAM radio
* Users can dynamically add new saved locations to their profile

## The 'Why?' and the 'How?':

There are many publicly searchable databases (RepeaterBook, Artsci Publishing, amateur-radio.net, and others) where users can retrieve information about repeaters in their area, but none provide a ready-to-export collection of that information where users can quickly load that data into their radio's memory! Manual data entry is tedious, time consuming, and error prone, but there's also no API to easily collect this information... enter HAMFinder!

My web app queries RepeaterBook.com's community-updated repository of local and regional 2m-band repeaters based on a user's input or saved database record, uses the Ruby gem Nokogiri to scrape the information, and parses it into a format that the open source program CHIRP can interpret and download directly to a user's HAM radio.

My hope is that this application will allow communication techs for search and rescue operations, police/fire/EMS first responders, and members of the Amateur Radio Emergency Service (ARES) to plan for the best by preparing their equipment quickly, accurately, efficiently, and easily for the worst situations - i.e. a grid-down emergency like a hurricane in South Florida, or a major earthquake in California. I also hope that this encourages more people to be less intimidated by amateur radio, by making their first radio easier to program and use!
