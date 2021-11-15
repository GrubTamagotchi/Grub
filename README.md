Original App Design Project - README Template
===

# Grub Tamagotchi 

https://i.imgur.com/zAgYOn3.gif

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
The purpose of this app is to allow the user to take care of the digital pet (Grub).

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Game
- **Mobile:** Would be primarily available on iOS phones, but can later be expanded to Android and desktops
- **Story:** Allow users to spend time taking care of their virtual pet. 
- **Market:** Anyone that wants to play something simple, easy, and cute can take care of their virtual pet. It won't require too much commitment, but can still make the user happy.
- **Habit:** It will be used at least once a day, to ensure the pet's health is good and that it's happy. Not too much commitment is needed, but if it's not taken care of, the pet will be unhappy.
- **Scope:** It'll start off with some basic needs given to the pet - eating, petting, and sleeping. Afterwards, it can be expanded upon with more actions, such as playing mini games, managing more than one pet, and interacting with other users' pets.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Have a login screen for user to keep track of their pet and score; a logout button as well
* Display the pet and some different emotions
* Have 3 options: Feed, Pet, Sleep
* A happiness score; goes up when taken care of, goes down when neglected for too long
* Giving it a name and displaying it

**Optional Nice-to-have Stories**

* Allow user to take care of more than one pet
* Giving the pet outfits
* Providing an in game currency for user to get more outfits
* Allow more actions - such as playing games with the pet


### 2. Screen Archetypes

* Login/Sign Up Screen
* Main Screen showing Grub
   * Showcases the pet
   * Has 3 buttons to interact with pet
   * Score shown
   * Logout button

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [fill out your first tab]
* [fill out your second tab]
* [fill out your third tab]

**Flow Navigation** (Screen to Screen)

* Login/Sign up Screen
   * Either sign up or login if you have an account
* Main Screen with Grub
   * Consists of pet with options to interaction
   * Has Score Board
   * Has Logout Button

## Wireframes
[Add picture of your hand sketched wireframes in this section] 
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>
![](https://i.imgur.com/Ist11Uw.png)


## Schema 
[This section will be completed in Unit 9]
### Models  
Property	Type	Description		
name 	String	name given to the virtual pet		
happiness	Number	score given to showcase pet's happiness level		
status	String	what the pet is currently feeling		
emotion 	Arrays	the different emotions the pet feels in relation to the status		
image	File	used to represent the pet's current state		
![image](https://user-images.githubusercontent.com/60450655/140628952-e109e6b0-bc9f-4ce2-85a3-7f27c013db21.png)

### Networking
- Login Screen 
  - (READ)Read user's credentials to log in
- Account Creation Screen 
  - (CREATE) Make an account
- Main Game Screen
  - (READ) Understand user's play inputs 
  - (UPDATE) Update pet's scores
