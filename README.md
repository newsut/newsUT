newsUT Team - README
===

# newsUT

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that allows users to read news articles from UT News sites such as the Daily Texan and see events going on by clubs.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** News & Social
- **Mobile:** iOS
- **Story:** 
- **Market:** UT Austin students
- **Habit:**
- **Scope:** Social and news platform for UT

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can login and logout
* User can use app without an account
* Different accounts (Regular user and a UT Organization)
* Feed of news articles
* Option to post an event (UT Organization only)
* Option to follow a UT Organization (Regular user only)

**Optional Nice-to-have Stories**

* Be able to save news articles
* See a map of events
* Navigate and sort articles by type
* Search for articles

### 2. Screen Archetypes

* Initial Login Screen
    * New user/UT org can sign up, login, or skip and use app without account
* Home Screen
    * Feed of news, events, and sports articles and news
    * Sort and navigate articles by type (optional)
    * Think Facebook feed
* Upcoming Events Feed
    * Feed of upcoming events
    * Calendar (optional)
* Intramural Sports Homepage (optional)
    * List teams and upcoming games
* Newsletters
    * List newsletters from orgs that user follows
    * For UT Orgs, post events option
* Single Newsletter
    * Displays a specific newsletter
* Browse/Search Clubs
    * Browse and search through UT clubs and organizations
    * Think Instagram Explore page
* Single Event Page
    * Details on upcoming event 
* Page for each UT Org/Club
    * Find information on club
    * Follow button for regular user to follow the org
* Settings
    * Contains Sign Up/Login/Logout

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Screen
* Upcoming Events Feed
* Intramural Sports Homepage (optional)
* Newsletters
* Browse/Search Clubs

**Flow Navigation** (Screen to Screen)

* Initial Login Screen
   * Tab View Controller
      * Home Screen
          * Single Event Page
* Upcoming Events Feed
   * Single Event Page
* Browse/Search Clubs
   * Settings
   * Page for each UT Org/Club
* Newsletters
   * Single Newsletter
* Single Event Page
    * Page for each UT Org/Club

## Wireframes (Digital Mockup) 
<img src="https://i.imgur.com/xapO14r.jpg" width=600>


### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
