import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Constants {
  var appVersion = "1.0.0";

  var dogBreeds = [
    '',
    'Retriever (Labrador)',
    'French Bulldog',
    'German Shepherd Dog',
    'Retriever (Golden)',
    'Bulldog',
    'Poodle',
    'Beagle',
    'Rottweiler',
    'Pointer (German Shorthaired)',
    'Dachshund',
    'Pembroke Welsh Corgi',
    'Australian Shepherd',
    'Yorkshire Terrier',
    'Boxer',
    'Great Dane',
    'Other - Please Specify'
  ];

  var catBreeds = [
    '',
    'Domestic Shorthair',
    'American Shorthair',
    'Domestic Longhair',
    'Maine Coon',
    'Siamese',
    'Russian Blue',
    'Ragdoll',
    'Bengal',
    'Persian',
    'Bombay',
    'Other - Please Specify'
  ];

  var otherBreeds = [
    '',
    'Rabbit',
    'Bird',
    'Fish',
    'Ferret',
    'Hamster',
    'Turtle',
    'Snake',
    'Crab',
    'Guinea Pig',
    'Other - Please Specify'
  ];

  var statesList = [
    'Alabama',
    'Alaska',
    'American Samoa',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'District of Columbia',
    'Florida',
    'Georgia',
    'Guam',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Minor Outlying Islands',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Northern Mariana Islands',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Puerto Rico',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'U.S. Virgin Islands',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming'
  ];

  static const String appName = 'Cuddler';
  static const String logoTag = 'animals logo';
  static const String titleTag = 'title';
  static const deepBlue = const Color(0xff264653);
  static const tealBlue = const Color(0xff2a9d8f);
  static const fadedYellow = const Color(0xffe9c46a);
  static const fadedOrange = const Color(0xfff4a261);
  static const redOrange = const Color(0xffe76f51);
}

// List uploadVals = [
//   [
//     "Leonila",
//     1,
//     "Retriever (Labrador)",
//     "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
//     "Mireille",
//     1621119800,
//     true,
//     false,
//     false,
//     "gobb@gmail.com",
//     false,
//     "Alabama",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1234",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Florencia",
//     5,
//     "French Bulldog",
//     "Hullo dahlings! I'm Alexa, and I have very strong views on the proper habitat for my gorgeousness, which involve hovering servants (you), a warm spot to rest on (your lap), and luxurious accommodations (your bed). Since despite my many wonderful qualities I lack opposable thumbs, you'll have to do the clicking for both of us.",
//     "Maragaret",
//     1621119800,
//     false,
//     false,
//     true,
//     "gobb@gmail.com",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1235",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Gonzalo",
//     9,
//     "German Shepherd Dog",
//     "Yeah, I know I've got that irresistible "
//         "Tramp"
//         " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
//         "Lady."
//         " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
//     "Shanita",
//     1621119800,
//     false,
//     false,
//     true,
//     "sariah.merrill@gmail.com",
//     false,
//     "Arizona",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1236",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Lorene",
//     5,
//     "Retriever (Golden)",
//     "I was saying to myself just this morning, "
//         "Lani,"
//         " I said, "
//         "Lani, you know what you need? You need a person all your own."
//         " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
//     "Alfonso",
//     1621119800,
//     false,
//     false,
//     false,
//     "sariah.merrill@gmail.com",
//     false,
//     "Arkansas",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1237",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Yuriko",
//     1,
//     "Bulldog",
//     "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
//     "Lyndon",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1238",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Carlotta",
//     2,
//     "Poodle",
//     "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
//     "Fabian",
//     1621119800,
//     false,
//     true,
//     false,
//     "hunter@gmail.com",
//     false,
//     "Colorado",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1239",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Celine",
//     7,
//     "Beagle",
//     "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
//     "Margarito",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "Connecticut",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1240",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Jacquelynn",
//     6,
//     "Rottweiler",
//     "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
//         "needing to learn manners"
//         " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
//         "GREAT"
//         " Danes and not just "
//         "OKAY"
//         " Danes or even "
//         "REALLY GOOD"
//         " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
//     "Camilla",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1241",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Milford",
//     2,
//     "Pointer (German Shorthaired)",
//     "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
//     "Jeneva",
//     1621119800,
//     true,
//     false,
//     false,
//     "maibr@oregonstate.edu",
//     false,
//     "Florida",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1242",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Lesli",
//     3,
//     "Dachshund",
//     "Hullo dahlings! I'm Alexa, and I have very strong views on the proper habitat for my gorgeousness, which involve hovering servants (you), a warm spot to rest on (your lap), and luxurious accommodations (your bed). Since despite my many wonderful qualities I lack opposable thumbs, you'll have to do the clicking for both of us.",
//     "Sherry",
//     1621119800,
//     false,
//     true,
//     false,
//     "maibr@oregonstate.edu",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1243",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Newton",
//     5,
//     "Pembroke Welsh Corgi",
//     "Yeah, I know I've got that irresistible "
//         "Tramp"
//         " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
//         "Lady."
//         " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
//     "Brian",
//     1621119800,
//     false,
//     true,
//     false,
//     "maibr@oregonstate.edu",
//     false,
//     "Hawaii",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1244",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Horace",
//     4,
//     "Australian Shepherd",
//     "I was saying to myself just this morning, "
//         "Lani,"
//         " I said, "
//         "Lani, you know what you need? You need a person all your own."
//         " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
//     "Lucila",
//     1621119800,
//     false,
//     true,
//     false,
//     "minikenh@oregonstate.edu",
//     false,
//     "Alaska",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1245",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Holly",
//     4,
//     "Yorkshire Terrier",
//     "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
//     "Manie",
//     1621119800,
//     false,
//     false,
//     false,
//     "minikenh@oregonstate.edu",
//     false,
//     "Arizona",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1246",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Shiloh",
//     6,
//     "Boxer",
//     "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
//     "Hiram",
//     1621119800,
//     false,
//     false,
//     true,
//     "minikenh@oregonstate.edu",
//     false,
//     "Arkansas",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1247",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Rosa",
//     7,
//     "Great Dane",
//     "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
//     "Soon",
//     1621119800,
//     true,
//     false,
//     true,
//     "minikenh@oregonstate.edu",
//     false,
//     "California",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1248",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Pedro",
//     9,
//     "Beagle",
//     "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
//         "needing to learn manners"
//         " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
//         "GREAT"
//         " Danes and not just "
//         "OKAY"
//         " Danes or even "
//         "REALLY GOOD"
//         " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
//     "Veda",
//     1621119800,
//     false,
//     false,
//     false,
//     "minikenh@oregonstate.edu",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1248",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Leona",
//     9,
//     "Rottweiler",
//     "Yeah, I know I've got that irresistible "
//         "Tramp"
//         " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
//         "Lady."
//         " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
//     "Shanita",
//     1621119800,
//     false,
//     false,
//     true,
//     "sariah.merrill@gmail.com",
//     false,
//     "Arizona",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1236",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Adrianne",
//     5,
//     "Pointer (German Shorthaired)",
//     "I was saying to myself just this morning, "
//         "Lani,"
//         " I said, "
//         "Lani, you know what you need? You need a person all your own."
//         " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
//     "Alfonso",
//     1621119800,
//     false,
//     false,
//     false,
//     "sariah.merrill@gmail.com",
//     false,
//     "Arkansas",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1237",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Donny",
//     1,
//     "German Shepherd Dog",
//     "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
//     "Lyndon",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "California",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1238",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Cyrus",
//     2,
//     "Retriever (Golden)",
//     "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
//     "Fabian",
//     1621119800,
//     false,
//     true,
//     false,
//     "hunter@gmail.com",
//     false,
//     "Colorado",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1239",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Jules",
//     7,
//     "Bulldog",
//     "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
//     "Margarito",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "Connecticut",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1240",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Rocco",
//     6,
//     "Rottweiler",
//     "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
//         "needing to learn manners"
//         " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
//         "GREAT"
//         " Danes and not just "
//         "OKAY"
//         " Danes or even "
//         "REALLY GOOD"
//         " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
//     "Camilla",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1241",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Royce",
//     2,
//     "German Shepherd Dog",
//     "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
//     "Jeneva",
//     1621119800,
//     true,
//     false,
//     false,
//     "maibr@oregonstate.edu",
//     false,
//     "Florida",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A04%3A29.277014?alt=media&token=06e9bc67-e66f-414b-87e0-314e37b151fb",
//     "555-555-1242",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ]
// ];

// List uploadVals = [
//   [
//     "Leonila",
//     1,
//     "Rabbit",
//     "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
//     "Mireille",
//     1621119800,
//     true,
//     false,
//     false,
//     "gobb@gmail.com",
//     false,
//     "Alabama",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1234",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Florencia",
//     5,
//     "Bird",
//     "Hullo dahlings! I'm Alexa, and I have very strong views on the proper habitat for my gorgeousness, which involve hovering servants (you), a warm spot to rest on (your lap), and luxurious accommodations (your bed). Since despite my many wonderful qualities I lack opposable thumbs, you'll have to do the clicking for both of us.",
//     "Maragaret",
//     1621119800,
//     false,
//     false,
//     true,
//     "gobb@gmail.com",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1235",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Gonzalo",
//     9,
//     "Fish",
//     "Yeah, I know I've got that irresistible "
//         "Tramp"
//         " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
//         "Lady."
//         " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
//     "Shanita",
//     1621119800,
//     false,
//     false,
//     true,
//     "sariah.merrill@gmail.com",
//     false,
//     "Arizona",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1236",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Lorene",
//     5,
//     "Ferret",
//     "I was saying to myself just this morning, "
//         "Lani,"
//         " I said, "
//         "Lani, you know what you need? You need a person all your own."
//         " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
//     "Alfonso",
//     1621119800,
//     false,
//     false,
//     false,
//     "sariah.merrill@gmail.com",
//     false,
//     "Arkansas",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1237",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Yuriko",
//     1,
//     "Hamster",
//     "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
//     "Lyndon",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1238",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Carlotta",
//     2,
//     "Turtle",
//     "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
//     "Fabian",
//     1621119800,
//     false,
//     true,
//     false,
//     "hunter@gmail.com",
//     false,
//     "Colorado",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1239",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Celine",
//     7,
//     "Snake",
//     "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
//     "Margarito",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "Connecticut",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1240",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Jacquelynn",
//     6,
//     "Crab",
//     "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
//         "needing to learn manners"
//         " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
//         "GREAT"
//         " Danes and not just "
//         "OKAY"
//         " Danes or even "
//         "REALLY GOOD"
//         " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
//     "Camilla",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1241",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Milford",
//     2,
//     "Guinea Pig",
//     "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
//     "Jeneva",
//     1621119800,
//     true,
//     false,
//     false,
//     "maibr@oregonstate.edu",
//     false,
//     "Florida",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1242",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Lesli",
//     3,
//     "Ferret",
//     "Hullo dahlings! I'm Alexa, and I have very strong views on the proper habitat for my gorgeousness, which involve hovering servants (you), a warm spot to rest on (your lap), and luxurious accommodations (your bed). Since despite my many wonderful qualities I lack opposable thumbs, you'll have to do the clicking for both of us.",
//     "Sherry",
//     1621119800,
//     false,
//     true,
//     false,
//     "maibr@oregonstate.edu",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1243",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Newton",
//     5,
//     "Hamster",
//     "Yeah, I know I've got that irresistible "
//         "Tramp"
//         " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
//         "Lady."
//         " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
//     "Brian",
//     1621119800,
//     false,
//     true,
//     false,
//     "maibr@oregonstate.edu",
//     false,
//     "Hawaii",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1244",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Horace",
//     4,
//     "Turtle",
//     "I was saying to myself just this morning, "
//         "Lani,"
//         " I said, "
//         "Lani, you know what you need? You need a person all your own."
//         " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
//     "Lucila",
//     1621119800,
//     false,
//     true,
//     false,
//     "minikenh@oregonstate.edu",
//     false,
//     "Alaska",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1245",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Holly",
//     4,
//     "Snake",
//     "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
//     "Manie",
//     1621119800,
//     false,
//     false,
//     false,
//     "minikenh@oregonstate.edu",
//     false,
//     "Arizona",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1246",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Shiloh",
//     6,
//     "Fish",
//     "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
//     "Hiram",
//     1621119800,
//     false,
//     false,
//     true,
//     "minikenh@oregonstate.edu",
//     false,
//     "Arkansas",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1247",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Rosa",
//     7,
//     "Ferret",
//     "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
//     "Soon",
//     1621119800,
//     true,
//     false,
//     true,
//     "minikenh@oregonstate.edu",
//     false,
//     "California",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1248",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Pedro",
//     9,
//     "Hamster",
//     "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
//         "needing to learn manners"
//         " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
//         "GREAT"
//         " Danes and not just "
//         "OKAY"
//         " Danes or even "
//         "REALLY GOOD"
//         " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
//     "Veda",
//     1621119800,
//     false,
//     false,
//     false,
//     "minikenh@oregonstate.edu",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1248",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Leona",
//     9,
//     "Turtle",
//     "Yeah, I know I've got that irresistible "
//         "Tramp"
//         " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
//         "Lady."
//         " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
//     "Shanita",
//     1621119800,
//     false,
//     false,
//     true,
//     "sariah.merrill@gmail.com",
//     false,
//     "Arizona",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1236",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Adrianne",
//     5,
//     "Snake",
//     "I was saying to myself just this morning, "
//         "Lani,"
//         " I said, "
//         "Lani, you know what you need? You need a person all your own."
//         " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
//     "Alfonso",
//     1621119800,
//     false,
//     false,
//     false,
//     "sariah.merrill@gmail.com",
//     false,
//     "Arkansas",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1237",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Donny",
//     1,
//     "Crab",
//     "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
//     "Lyndon",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "California",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1238",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Cyrus",
//     2,
//     "Rabbit",
//     "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
//     "Fabian",
//     1621119800,
//     false,
//     true,
//     false,
//     "hunter@gmail.com",
//     false,
//     "Colorado",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1239",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Jules",
//     7,
//     "Rabbit",
//     "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
//     "Margarito",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "Connecticut",
//     "Female",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1240",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Rocco",
//     6,
//     "Snake",
//     "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
//         "needing to learn manners"
//         " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
//         "GREAT"
//         " Danes and not just "
//         "OKAY"
//         " Danes or even "
//         "REALLY GOOD"
//         " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
//     "Camilla",
//     1621119800,
//     false,
//     false,
//     false,
//     "hunter@gmail.com",
//     false,
//     "California",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1241",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ],
//   [
//     "Royce",
//     2,
//     "Snake",
//     "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
//     "Jeneva",
//     1621119800,
//     true,
//     false,
//     false,
//     "maibr@oregonstate.edu",
//     false,
//     "Florida",
//     "Male",
//     "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
//     "555-555-1242",
//     "Available",
//     "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
//   ]
// ];

List uploadVals = [
  [
    "Leonila",
    1,
    "Domestic Shorthair",
    "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
    "Mireille",
    1621119800,
    true,
    false,
    false,
    "gobb@gmail.com",
    false,
    "Alabama",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1234",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Florencia",
    5,
    "American Shorthair",
    "Hullo dahlings! I'm Alexa, and I have very strong views on the proper habitat for my gorgeousness, which involve hovering servants (you), a warm spot to rest on (your lap), and luxurious accommodations (your bed). Since despite my many wonderful qualities I lack opposable thumbs, you'll have to do the clicking for both of us.",
    "Maragaret",
    1621119800,
    false,
    false,
    true,
    "gobb@gmail.com",
    false,
    "California",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1235",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Gonzalo",
    9,
    "Domestic Longhair",
    "Yeah, I know I've got that irresistible "
        "Tramp"
        " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
        "Lady."
        " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
    "Shanita",
    1621119800,
    false,
    false,
    true,
    "sariah.merrill@gmail.com",
    false,
    "Arizona",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1236",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Lorene",
    5,
    "Maine Coon",
    "I was saying to myself just this morning, "
        "Lani,"
        " I said, "
        "Lani, you know what you need? You need a person all your own."
        " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
    "Alfonso",
    1621119800,
    false,
    false,
    false,
    "sariah.merrill@gmail.com",
    false,
    "Arkansas",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1237",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Yuriko",
    1,
    "Siamese",
    "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
    "Lyndon",
    1621119800,
    false,
    false,
    false,
    "hunter@gmail.com",
    false,
    "California",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1238",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Carlotta",
    2,
    "Russian Blue",
    "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
    "Fabian",
    1621119800,
    false,
    true,
    false,
    "hunter@gmail.com",
    false,
    "Colorado",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1239",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Celine",
    7,
    "Ragdoll",
    "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
    "Margarito",
    1621119800,
    false,
    false,
    false,
    "hunter@gmail.com",
    false,
    "Connecticut",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1240",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Jacquelynn",
    6,
    "Bengal",
    "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
        "needing to learn manners"
        " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
        "GREAT"
        " Danes and not just "
        "OKAY"
        " Danes or even "
        "REALLY GOOD"
        " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
    "Camilla",
    1621119800,
    false,
    false,
    false,
    "hunter@gmail.com",
    false,
    "California",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1241",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Milford",
    2,
    "Persian",
    "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
    "Jeneva",
    1621119800,
    true,
    false,
    false,
    "maibr@oregonstate.edu",
    false,
    "Florida",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1242",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Lesli",
    3,
    "Bombay",
    "Hullo dahlings! I'm Alexa, and I have very strong views on the proper habitat for my gorgeousness, which involve hovering servants (you), a warm spot to rest on (your lap), and luxurious accommodations (your bed). Since despite my many wonderful qualities I lack opposable thumbs, you'll have to do the clicking for both of us.",
    "Sherry",
    1621119800,
    false,
    true,
    false,
    "maibr@oregonstate.edu",
    false,
    "California",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1243",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Newton",
    5,
    "Maine Coon",
    "Yeah, I know I've got that irresistible "
        "Tramp"
        " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
        "Lady."
        " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
    "Brian",
    1621119800,
    false,
    true,
    false,
    "maibr@oregonstate.edu",
    false,
    "Hawaii",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1244",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Horace",
    4,
    "Siamese",
    "I was saying to myself just this morning, "
        "Lani,"
        " I said, "
        "Lani, you know what you need? You need a person all your own."
        " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
    "Lucila",
    1621119800,
    false,
    true,
    false,
    "minikenh@oregonstate.edu",
    false,
    "Alaska",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1245",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Holly",
    4,
    "Russian Blue",
    "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
    "Manie",
    1621119800,
    false,
    false,
    false,
    "minikenh@oregonstate.edu",
    false,
    "Arizona",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1246",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Shiloh",
    6,
    "American Shorthair",
    "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
    "Hiram",
    1621119800,
    false,
    false,
    true,
    "minikenh@oregonstate.edu",
    false,
    "Arkansas",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1247",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Rosa",
    7,
    "Domestic Longhair",
    "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
    "Soon",
    1621119800,
    true,
    false,
    true,
    "minikenh@oregonstate.edu",
    false,
    "California",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1248",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Pedro",
    9,
    "Maine Coon",
    "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
        "needing to learn manners"
        " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
        "GREAT"
        " Danes and not just "
        "OKAY"
        " Danes or even "
        "REALLY GOOD"
        " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
    "Veda",
    1621119800,
    false,
    false,
    false,
    "minikenh@oregonstate.edu",
    false,
    "California",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1248",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Leona",
    9,
    "Siamese",
    "Yeah, I know I've got that irresistible "
        "Tramp"
        " thing going on. But here's my secret, just between you and me: I'll love you even if you're no "
        "Lady."
        " Because I won't check your pedigree, your bank account or your credit score. I'm only interested in checking out one thing about you: The size of your heart. And if there's room for a scruffy little dog named Stitch, then it's just the right size for me.",
    "Shanita",
    1621119800,
    false,
    false,
    true,
    "sariah.merrill@gmail.com",
    false,
    "Arizona",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1236",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Adrianne",
    5,
    "Russian Blue",
    "I was saying to myself just this morning, "
        "Lani,"
        " I said, "
        "Lani, you know what you need? You need a person all your own."
        " So I sat down to write this post for the nice Shelter Pet Project people, because apparently that's the kind of thing they do - find nice people for extremely intelligent and lovable, slightly senior kitties who are...I shudder to type this...LAPLESS. That's right: I have no lap to call my own. Could you be persuaded to volunteer yours?",
    "Alfonso",
    1621119800,
    false,
    false,
    false,
    "sariah.merrill@gmail.com",
    false,
    "Arkansas",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1237",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Donny",
    1,
    "Ragdoll",
    "Yes. Okay, already. I'm a dog. I really am. I'm not a porcupine or a tribble or whatever you were about to guess. And I may be a little gray around the muzzle and need some special TLC, but doesn't every dog deserve that when she gets to be my age? I'm Dolly, and you can verify my real, true, loyal, loving doggy heart and soul by visiting me at Displaced Pets Rescue in Vernonia.",
    "Lyndon",
    1621119800,
    false,
    false,
    false,
    "hunter@gmail.com",
    false,
    "California",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1238",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Cyrus",
    2,
    "Bengal",
    "Do you see what I'm reduced to? Cuddling with a STUFFED ANIMAL instead of a warm, breathing, can-opening, treat-dispensing, cat-toy-wielding, real, live human person to call my very own! I'm Toffee, and you need to fix this problem for me IMMEDIATELY.",
    "Fabian",
    1621119800,
    false,
    true,
    false,
    "hunter@gmail.com",
    false,
    "Colorado",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1239",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Jules",
    7,
    "Persian",
    "Hmmm, yes. I see you there. And really, if you're going to think I'd PERFORM for you, like a DOG or one of those lesser cats who BAT at things or make annoying little mewing sounds...well, you clearly haven't met a really PROPER cat. Such as myself, Charles. However, if you have a truly sensitive nature and appropriate living situation to offer, I will consider you as a potential human companion. Perhaps.",
    "Margarito",
    1621119800,
    false,
    false,
    false,
    "hunter@gmail.com",
    false,
    "Connecticut",
    "Female",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1240",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Rocco",
    6,
    "Bombay",
    "GO BIG OR GO HOME! If that's your motto, then I'm your dog! I'm Scooby, and I'm a 5-year-old some have described as "
        "needing to learn manners"
        " but I prefer to think of as EXUBERANT and FUN-LOVING! I'm really, really excited to meet you and show you just why they call us "
        "GREAT"
        " Danes and not just "
        "OKAY"
        " Danes or even "
        "REALLY GOOD"
        " Danes. You will love me; I guarantee it! And if not, don't you have a friend or relative who needs some BIG DOG LOVE?",
    "Camilla",
    1621119800,
    false,
    false,
    false,
    "hunter@gmail.com",
    false,
    "California",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1241",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ],
  [
    "Royce",
    2,
    "Maine Coon",
    "Fish gotta swim... birds gotta fly... I gotta sing and sing until I FIND MY FOREVER HOME WITH YOU! (Fooled ya, didn't I?) I'm Daisy, and I'm so full of love that my foster mom says I'd be a great therapy dog, because apparently the opera is not hiring just now. Want to sing along?",
    "Jeneva",
    1621119800,
    true,
    false,
    false,
    "maibr@oregonstate.edu",
    false,
    "Florida",
    "Male",
    "https://firebasestorage.googleapis.com/v0/b/cuddler-bd524.appspot.com/o/image2021-05-09%2012%3A10%3A40.300721?alt=media&token=51c6e105-ff53-4675-aa22-d4d86d77ba49",
    "555-555-1242",
    "Available",
    "I1tRDK1UeCV3kyeUbU9jjUj7NoX2"
  ]
];

uploadPets() {
  for (int i = 0; i < uploadVals.length; i++)
    FirebaseFirestore.instance.collection('cats').add({
      'name': uploadVals[i][0],
      'age': uploadVals[i][1],
      'breed': uploadVals[i][2],
      'about': uploadVals[i][3],
      'contactName': uploadVals[i][4],
      'dateAdded': uploadVals[i][5],
      'disposition1': uploadVals[i][6],
      'disposition2': uploadVals[i][7],
      'disposition3': uploadVals[i][8],
      'email': uploadVals[i][9],
      'favorite': uploadVals[i][10],
      'location': uploadVals[i][11],
      'sex': uploadVals[i][12],
      'url': uploadVals[i][13],
      'phone': uploadVals[i][14],
      'uid': "I1tRDK1UeCV3kyeUbU9jjUj7NoX2",
      'status': uploadVals[i][15],
    });
}

//   FirebaseFirestore.instance.collection("users").get().then((querySnapshot) {
//     querySnapshot.docs.forEach((result) {
//       FirebaseFirestore.instance.collection('users').doc(result.id).update({
//         'uid': "I1tRDK1UeCV3kyeUbU9jjUj7NoX2",
//       });
//     });
//   });
// }
