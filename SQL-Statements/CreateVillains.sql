DELETE FROM Villains;

-- In order so we can read it
INSERT INTO Villains(TeamName, RealName, VillainName, Abilities, Status)
VALUES("Independent", "Smokington", "Smokey", "Invisibility, Morph into shadows, Immaterial", "Active"),
	("????", "Frank Horrigan", "Frank Horrigan", "Mutated Human, Bullet Immunity, Armoured Skin, Uses Plasma Blades, Super Strength, Loves to crush things", "Active"),
      ("Team 1", "Valerie Bell", "Never Mist", "Summons a cloud she can ride and a sniper rifle of ice. The rifle fires ice bullets that freeze any object its fired at.", "Active"),
      ("Team 1", "????", "Rat Run", "Can move at super speed, but only if no one can see him. At his strongest in total darkness.", "Active"),
      ("Team 2", "Candice", "Nuclear Palm", "Close-range specialist. If one hand is tied behind her back, her other palm can deliver high impact strikes.", "Active"),
      ("Team 2", "Lake Smith", "Lustre", "Summons concussive bombs that when thrown flash and explode upon impact, disorienting anyone in range.", "Active"),
      ("????", "Lenore Dare", "MechAneurysm", "Builds high tech devices that can hack any technology it touches; Uses a flying hover board; Wears a Metalic mask", "Active"),
      ("Team 3", "Eileen", "Eileen", "Invisibility, Flying", "Active"),
      ("Team 3", "????", "Smores", "Demon; Can Fly: Breathes Fire; Gargoyle like body", "Active"),
      ("Team 3", "????", "Scabbard", "Can peel a wound from his body to heal, turning the peeled wound into the blade of a one-time use sword that can inflict itself onto others before disappearing.", "Active"),
      ("Team 4", "Ronald McDonald", "McSterminator", "Clown", "Active"),
      ("Team 4", "Robert Bunning", "Werehouse Man", "Has super strength from 6:30am to 9:00pm on weekdays. Will beat you by 10%.", "Active"),
      ("Team 4", "????", "Chicken Threat", "If he views someoneo or something as a threat, he receives a speed boost", "Active"),
      ("Team 4", "????", "Dread Rooster", "Metalic Beak on Mask, 4x effective against eyes", "Active"),
      ("Team 5", "Dan Pengress", "Man in the Van", "Hacker extraordaire, stays in a van during teams heists, which has technology to hack any device remotely", "Active"),
      ("Team 5", "Victoria Ruvin", "Evil Her-mes", "Super Speed; Extremely Loyal to her 3 other team mates, loves to wear bright red clothing", "Active"),
      ("Team 5", "????", "Hellakinetic", "Can telekinetically control small objects with his mind.", "Active"),
      ("????", "Johnny Tex", "Freeze Tag", "Can freeze anything he touches, and radiates cold. Also immune to freezing of any kind. Loves to mention he's from Texas.", "Active"),
      ("Independent", "????", "The Shep-head", "A master of disguise never seen without their rubber sheep mask. Possesses the strength and abilities of a normal human shepherd.", "Active"),
      ("Independent", "Robert Smalls", "The Immortal", "Has lived for over 70 years without dying even once.", "Deceased"),
      ("????", "Maka Hirano", "Blasta la Vista", "A Demolition Expert, from fire crackers to napalm, this villain has it all. At 4 foot 9 inches they found a new way to make an impact. Their one weakness is being gently bumped into, triggering an explosion from one of the many bombs in their pouches", "Active"),
      ("Team 6", "Genevieve Simmons", "Flare-do", "Has hair made of flame that she can manipulate and style at will. She never washes it.", "Deceased"),
      ("Team 6", "Carl Brand", "Pompasaur", "Has a living pompadour that can bite with the force of a T-Rex.", "Deceased"),
      ("Team 6", "????", "Pixie", "Can shake her pixie cut to summon magical sparkles that adhere to her enemies and are very difficult to remove.", "Deceased"),
      ("Team 6", "Moe Sidebottom", "Moe-Hawk", "Sprouts wings of hair from his mohawk to fly.", "Deceased"),
      ("Independent", "Cameron Paul", "Cannonball", "Can jump an extraordinary distance at extreme speeds when tucked into a ball.", "Active"),
      ("Independent", "????", "Deadline", "Can summon a cursed phone to talk to the dead.", "Active"),
      ("Independent", "????", "Mr. Jenga", "Can telekinetically control bones.", "Active"),
      ("????", "????", "Queen Bee", "Can control bees.", "Active"),
      ("Independent", "Simon", "Simon", "Can convince anyone who can hear him to do anything by saying 'Simon says' before any command.", "Active"),
      ("Team 7", "????", "Fox", "Unrivalled speed at eating ramen.", "Active"),
      ("Team 7", "????", "Edge", "Has the power to make everyone around him sad.", "Active"),
      ("Team 7", "????", "Blossom", "Massive crushing power with strikes from her forehead.", "Active"),
      ("Team 8", "Lara Waters", "Flood", "Can summon control and manipulate water.", "Deceased"),
      ("Team 8", "????", "RC", "Has an opaque ghost clone of himself that he can remotely control as long as his real body is safe.", "Active"),
      ("Team 8", "Gavin Edgeworth", "Gravatro", "Can raise and lower gravity in areas of his choosing.", "Deceased"),
      ("Independent", "????", "Bistro", "Deranged chef wielding a cleaver. Has boosted speed towards victims who have been seasoned.", "Active"),
      ("Independent", "Xander Prince", "Legion", "Within a 20-meter radius, Xander can make a number of people think and act as if they shared the mind and perspective of a single model person of his choosing—also within that radius. The number of people he can control depends on the willpower of the controlled and the conviction of the model.", "Active"),
      ("Independent", "Rolo Peters", "Gacha Man", "Has a large dial on his chest which, when twisted, causes a gacha ball to pop out of his mouth. Opening it grants him a random ability for an hour. These abilities can stack and have varying levels of convenience, some might just be straight up hindrances.", "Active"),
      ("Independent", "Adrianna Riviera", "Hoop", "Can float and fire purple energy bracelets at enemies to ensnare them. She can explode the bracelets on command with a power concussive blast.", "Active")
      ;
      
-- Random order so students have to sort it
INSERT INTO Villains(TeamName, RealName, VillainName, Abilities, Status)
VALUES            ("Independent", "????", "Mr. Jenga", "Can telekinetically control bones.", "Active"),
      ("????", "Johnny Tex", "Freeze Tag", "Can freeze anything he touches, and radiates cold. Also immune to freezing of any kind. Loves to mention he's from Texas.", "Active"),
      ("Team 8", "Gavin Edgeworth", "Gravatro", "Can raise and lower gravity in areas of his choosing.", "Deceased"),
      ("????", "Maka Hirano", "Blasta la Vista", "A Demolition Expert, from fire crackers to napalm, this villain has it all. At 4 foot 9 they found a new way to make an impact. Their one weakness is being gently bumped into, triggering an explosion from one of the many bombs in their pouches", "Active"),
      ("Team 4", "????", "Chicken Threat", "If he views someoneo or something as a threat, he receives a speed boost", "Active"),
      ("Team 4", "Robert Bunning", "Werehouse Man", "Has super strength from 6:30am to 9:00pm on weekdays. Will beat you by 10%.", "Active"),
      ("Independent", "Xander Prince", "Legion", "Within a 20-meter radius, Xander can make a number of people think and act as if they shared the mind and perspective of a single model person of his choosing—also within that radius. The number of people he can control depends on the willpower of the controlled and the conviction of the model.", "Active"),
      ("Team 6", "Carl Brand", "Pompasaur", "Has a living pompadour that can bite with the force of a T-Rex.", "Deceased"),
      ("Team 6", "????", "Pixie", "Can shake her pixie cut to summon magical sparkles that adhere to her enemies and are very difficult to remove.", "Deceased"),
      ("Team 7", "????", "Blossom", "Massive crushing power with strikes from her forehead.", "Active"),
      ("Team 3", "????", "Smores", "Demon; Can Fly: Breathes Fire; Gargoyle like body", "Active"),
      ("Team 6", "Moe Sidebottom", "Moe-Hawk", "Sprouts wings of hair from his mohawk to fly.", "Deceased"),
      ("Team 7", "????", "Fox", "Unrivalled speed at eating ramen.", "Active"),
      ("Team 4", "????", "Dread Rooster", "Metalic Beak on Mask, 4x effective against eyes", "Active"),
      ("Independent", "????", "Deadline", "Can summon a cursed phone to talk to the dead.", "Active"),
      ("Team 4", "Ronald McDonald", "McSterminator", "Clown", "Active"),
      ("????", "????", "Queen Bee", "Can control bees.", "Active"),
      ("Team 2", "Candice", "Nuclear Palm", "Close-range specialist. If one hand is tied behind her back, her other palm can deliver high impact strikes.", "Active"),
      ("Team 8", "Lara Waters", "Flood", "Can summon control and manipulate water.", "Deceased"),
      ("Team 3", "????", "Scabbard", "Can peel a wound from his body to heal, turning the peeled wound into the blade of a one-time use sword that can inflict itself onto others before disappearing.", "Active"),
      ("Independent", "Simon", "Simon", "Can convince anyone who can hear him to do anything by saying 'Simon says' before any command.", "Active"),
      ("Team 1", "????", "Rat Run", "Can move at super speed, but only if no one can see him. At his strongest in total darkness.", "Active"),
      ("Independent", "Smokington", "Smokey", "Invisibility, Morph into shadows, Immaterial", "Active"),
      ("Independent", "Rolo Peters", "Gacha Man", "Has a large dial on his chest which, when twisted, causes a gacha ball to pop out of his mouth. Opening it grants him a random ability for an hour. These abilities can stack and have varying levels of convenience, some might just be straight up hindrances.", "Active"),
      ("Independent", "????", "Bistro", "Deranged chef wielding a cleaver. Has boosted speed towards victims who have been seasoned.", "Active"),
      ("Team 5", "????", "Hellakinetic", "Can telekinetically control small objects with his mind.", "Active"),
      ("Team 1", "Valerie Bell", "Never Mist", "Summons a cloud she can ride and a sniper rifle of ice. The rifle fires ice bullets that freeze any object its fired at.", "Active"),
      ("Team 6", "Genevieve Simmons", "Flare-do", "Has hair made of flame that she can manipulate and style at will.", "Deceased"),
      ("????", "Lenore Dare", "MechAneurysm", "Builds high tech devices that can hack any technology it touches; Uses a flying hover board; Wears a Metalic mask", "Active"),
      ("Team 5", "Victoria Ruvin", "Evil Her-mes", "Super Speed; Extremely Loyal to her 3 other team mates, loves to wear bright red clothing", "Active"),
      ("Team 5", "Dan Pengress", "Man in the Van", "Hacker extraordaire, stays in a van during teams heists, which has technology to hack any device remotely", "Active"),
      ("Team 2", "Lake Smith", "Lustre", "Summons concussive bombs that when thrown flash and explode upon impact, disorienting anyone in range.", "Active"),
      ("Team 7", "????", "Edge", "Has the power to make everyone around him sad.", "Active"),
      ("Team 3", "Eileen", "Eileen", "Invisibility, Flying", "Active"),
      ("Independent", "????", "The Shep-head", "A master of disguise never seen without their rubber sheep mask. Possesses the strength and abilities of a normal human shepherd.", "Active"),
      ("Team 8", "????", "RC", "Has an opaque ghost clone of himself that he can remotely control as long as his real body is safe.", "Active"),
      ("Independent", "Robert Smalls", "The Immortal", "Has lived for over 70 years without dying even once.", "Deceased"),
	  ("????", "Frank Horrigan", "Frank Horrigan", "Mutated Human, Bullet Immunity, Armoured Skin, Uses Plasma Blades, Super Strength, Loves to crush things", "Active"),
      ("Independent", "Cameron Paul", "Cannonball", "Can jump an extraordinary distance at extreme speeds when tucked into a ball.", "Active"),
      ("Independent", "Adrianna Riviera", "Hoop", "Can float and fire purple energy bracelets at enemies to ensnare them. She can explode the bracelets on command with a power concussive blast.", "Active")
      ;
