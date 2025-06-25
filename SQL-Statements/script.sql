DROP TABLE Heroes;
DROP TABLE Witnesses;
DROP TABLE Villains;
DROP TABLE Briefings;
DROP TABLE Locations;

CREATE TABLE IF NOT EXISTS Heroes (
	Name VARCHAR(128),
    Abilities VARCHAR(256),
    Status ENUM('Active', 'Retired', 'Deceased'),
    Cost INT,
    PRIMARY KEY(Name)
) COMMENT = 'Stores hero information pertaining to their identification, abilities, and availability.';

CREATE TABLE IF NOT EXISTS Witnesses (
	BriefingID INT,
	Name VARCHAR(128),
    Occupation VARCHAR(128),
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    Statement VARCHAR(1024),
    PRIMARY KEY(BriefingID, Name)
) COMMENT = 'Stores witness testimonies correlating to briefings in the Briefings table.';

CREATE TABLE IF NOT EXISTS Villains (
    TeamName VARCHAR(256),
    RealName VARCHAR(128),
	VillainName VARCHAR(100),
    Abilities VARCHAR(512),
    Status ENUM('Active', 'Retired', 'Incareated', 'Deceased'),
    PRIMARY KEY(RealName , TeamName, VillainName)
) COMMENT = 'Stores villain information pertaining to their identification, abilities, and current active status.';

CREATE TABLE IF NOT EXISTS Briefings (
	BriefingID INT NOT NULL,
    Location VARCHAR(128),
    Description VARCHAR(1024),
    Date DATE,
    PRIMARY KEY(BriefingID)
) COMMENT = 'Stores information regarding criminal incidents that have occurred.';

CREATE TABLE IF NOT EXISTS Locations(
	LocationID INT NOT NULL,
    Sector VARCHAR(24),
    Address VARCHAR(128),
    Description VARCHAR(1024),
    EvilVibeScore INT,
    PRIMARY KEY(LocationID)
) COMMENT = 'Stores information regarding locations on Planet Heroes.';

CREATE TABLE IF NOT EXISTS Solutions(
	Scenario INT,
    Answer VARCHAR(256),
    PRIMARY KEY(Scenario)
) COMMENT = 'Where you will submit your answers! Insert the scenario number into the first column and your answer to it into the second, then run the solution_check() method in mysql-client.py.';



DELETE FROM Briefings;

INSERT INTO Briefings(BriefingID, Location, Description, Date)
VALUES( 1, "Observatory, New York",
		"Villains broke into the Observatory, in an attempt to steal an Iridium satellite plate. 7 inch deep scratches were left behind in the concrete floor, causing parts of the floor to melt. Locks on doors were destroyed by a high velocity object, but no bullets were left behind. All Employee lunches were taken from the commune fridge.",
        "2022-10-22"),

		( 2, "Antartica, Antartica",
		"Antartica was melted, and then reformed larger than what it was before. The damage left from the rising tides was immeasurable. No humans witnessed or survived the event.",
        "2015-01-08"),

        ( 3, "EU Embassy, Texas",
		"Three men were caught jay walking infront of the EU embassy. Not wanting to seem weak in front of their foreign allies, the local sheriff authorised a military strike team to apprehend the villains. A fourth individual arrived and immobolised the strike team, and released the three caught men. Twenty soldiers were assigned to bed rest, with injuries spanning from booboos to ouchies. Three helicopers, one tank, and the pride of the american military, eviscerated",
        "2015-01-08"),

        ( 4, "New York Central Cemetary, New York",
		"The Necrodancer, using funky infectious beats, raised the dead in New York Central Cemetery. The dead were drawn towards disco rinks and influencers recording dance videos. They attacked anyone who attempted to prevent them from their next dance.",
        "2023-12-14"),

        ( 5, "Budapest Intra Infernum Hospital, Budapest",
		"The McSterminator and Chicken Threat attempted to steal a serum from the Budapest Intra Infernum Hospital. To prevent them from taking it, Dr Diabolus injected an intern with the serum. The intern's skin became hardened, and sprouted wings and horns. In the chaos, a fire broke out, and burnt the hospital to the ground. The intern was not found.",
        "2016-06-06"),

        ( 6, "777 Pharmacy, Perth",
        "Hellakinetic goes ballistic at Greg's pharmacy after the cashier informed him that they were out of Omega 3 supplements. He began telekinetically lifting and firing only the most lethal sounding pills from shelves at customers and staff. Victims reported temporary relief after being struck by the painkillers.",
        "2013-03-07"),

        ( 7, "German Federal Bank, Frankfurt",
        "The German Federal Bank — Germany's central bank — has been robbed. During the robbery, the security system was hacked, and reports say the temperature of the surrounding area dropped to approximately -3°C.",
        "2025-05-30"
        ),

        ( 8, "Central Park, New York",
        "Retired supervillain Dr. Birdbrain was caught up to his old tricks illegally feeding pigeons at the local park. As police approached, the elderly villain shouted \"I'm not going to jail again! Eat bread, coppers!\" He then threw a wad of bread at the ground, causing a deluge of pigeons to descend upon his position and cover his escape. Dr. Birdbrain was arrested a few short paces from his original position after the birds disbursed",
        "2022-06-22"),

        ( 9, "The White House, Washington D.C.",
        "Citizens shocked as a large, mysterious portal opens up in the sky, revealing the face of an unknown green alien. The alien says \"muahahaha! Good morning, New York, I hope you're ready for a nice bowl of evil for breakf-... Is that a filter? How do I turn this thing off? Elijah! How do I turn this thing of-.\" The portal winks out of existence. Police continue to investigate this chilling incident.",
        "2024-01-05"),

        ( 10, "Belgium Royal Castle, Belgium",
        "The Belgian Royal Family — which definitely exists and should not be Googled — has been taken hostage. During the raid, the country’s national data system, stored on servers deep within the castle, was hacked, and all civilian data was stolen. The only item left behind by the perpetrator was a swanky red Nike shoe.",
        "2023-06-12"
        ),

        ( 11, "The Lourve, Paris",
        "The villains Smokey, Frank Horrigan, Never Mist, Rat Run, and a hacker who was never officially identified stole the Mona Lisa. During the heist, the lighting system was hacked, plunging the museum into darkness. It was assumed that the lights were meant to be turned back on after Rat Run escaped with the painting, but this never happened — which led to Frank Horrigan’s capture.",
        "2000-04-17"
        ),

        ( 12, "Notre Dame",
        "The Super Villains Victoria Ruvin and Johnny Tex wed in Notre Dame, after their team kidnapped the pope to perform the ceremony, and took control of the chapel. Their wedding registrary directly correlates to a series of robberies earlier in the day. The fireworks set off during reception also destroyed local police stations.",
        "2006-09-29"),

        ( 13, "Wellington, New Zealand",
        "In broad daylight, the Shep-head facilitated the escape of of sheep from several local farms. Sheep rampaged through the city, causing very little damage. In attempts to enumerate the number of enemies, thousands of casualties fell unconscious, totally ruining their sleep schedules.",
        "2008-05-27"
        );

        DELETE FROM Heroes;

INSERT INTO Heroes(Name, Abilities, Status, Cost)
VALUES
	("Disco Man", "Has a Discoball helmet, which allows for 360 vision. Blinding light can be shot from each surface on the ball.", "Active", 8000),
    ("Solaris", "Harnesses solar energy for flight, energy blasts, and enhanced strength.", "Active", 22000),
	("Frostbite", "Controls ice and cold, can create ice constructs and lower temperatures.", "Deceased", 18000),
	("Spectra", "Can manipulate light to create illusions and become invisible.", "Active", 15000),
	("Thunderclap", "Generates shockwaves and sonic booms with his claps.", "Retired", 17000),
	("Archer", "Uses a bow and arrow for long range attacks. Has an assortment of arrows that can be used from immobilising enemies, to knocking them out cold.", "Active", 3000),
	("Pyra", "Controls fire, can generate and project flames.", "Active", 6000),
	("Aquaheart", "Communicates with marine life, manipulates water.", "Active", 15000),
	("Mindwarp", "Powerful telepath with mind control and telekinesis.", "Retired", 23000),
	("Steelblade", "Has an indestructible metallic body and super strength.", "Deceased", 19000),
    ("Doomba", "A repurposed Roomba that can deliver strong EMP blasts. Doomba has sentience.", "Active", 5000),
	("Vortex", "Controls wind and creates powerful whirlwinds.", "Active", 16000),
	("Lumina", "Emits blinding light and can heal minor injuries.", "Retired", 14000),
	("Quake", "Creates and controls earthquakes and tremors.", "Active", 20000),
	("Mystic", "Wields ancient magic for spellcasting and enchantments.", "Active", 22000),
	("Titan", "Grows to giant size, increasing strength and durability.", "Deceased", 25000),
	("Nebula", "Manipulates cosmic energy and has limited flight.", "Active", 21000),
	("Echo", "Can duplicate sounds and voices, creating confusion.", "Active", 13000),
	("Phantom", "Passes through solid objects and becomes intangible.", "Retired", 16000),
	("Blaze", "Super speed and friction-generated flames.", "Deceased", 18000),
	("Crimson Wing", "Flight with razor-sharp wings and enhanced agility.", "Deceased", 17000),
    ("Reflex", "Superhuman reflexes and agility for close combat and evasive maneuvers.", "Active", 13000),
    ("PayBack", "Any energy that they're hit with can be absorbed, and sent back to where it came from. Works with physical and magical powers, a hero for all occasions.", "Active", 9000),
	("Bullseye", "Perfect aim with any projectile, making them a versatile marksman.", "Active", 18000),
	("Volt", "Controls and generates electricity. Can create EMP blasts, fire electrical attacks, and power electrical machinery.", "Active", 20000),
	("Absorption", "Absorbs energy and redirects it in powerful bursts, gains enhanced strength and durability", "Active", 28000),
	("Mirrorball", "Reflects and manipulates light for blinding flashes, invisibility, and illusions", "Active", 22000),
    ("Shadowstrike", "Master of stealth and shadow manipulation.", "Active", 14000),
    ("Galadin", "Can summon a sword, shield and full set of armour of hardened light.", "Retired", 5000),
    ("Sludgema", "Can turn themself into a puddle of goo.", "Active", 3000),
    ("Arachnid Bro", "Can sling webs from afar to immobilise enemies.", "Active", 9000),
    ("The Kidna", "Can sprout and fire spikes from his back.", "Retired", 8000),
    ("Prop", "Can morph into any inaminate object within reach and somehow move as that object.", "Active", 5000),
	("Mindshot", "Can enter the dreams of living things and take photos to bring back to the real world.", "Active", 7000),
	("Plum", "Can become purple.", "Active", 2000),
	("Vantern", "Summons a cursed lantern which plunges eveything in its range into a sphere of darkness, blinding anyone inside with everyone outside unable to see in.", "Active", 7000),
	("Ballet", "Charges a powerful kick that becomes more lethal the longer they sustain a pirouette before unleashing the kick. Dropping the pirouette resets the charge.", "Active", 5000),
	("Tempura Ballista", "Fires a spray of boiling hot oil and breading from an enchanted frying pan.", "Active", 12000),
    ("Time Warp", "Can slow down time, useful for catching villains with super speed.", "Active", 8000)
	;

DELETE FROM Locations;

INSERT INTO Locations(LocationID, Sector, Address, Description, EvilVibeScore)
VALUES
  ( 1
    ,"A"
    ,"Blackthorn Castle"
    ,"A remote and dilapidated castle on the outskirts of the city. Once a historical landmark turned museum, the city discovered it could generate far more income by renting the space out to eccentric supervillains. Its acoustic spires provide ideal stages for maniacal laughter, while the gift shop serves as a perfect front for any money laundering operations. The abysmal wi-fi helps to preserve its integrity as a timeless relic of a simpler time."
    ,8),
  ( 2
    ,"A"
    ,"City Sewers"
    ,"Concealed beneath the city, there are villains which call the web of dimly lit sewers, ferrying waste from pipe to pipe, home. It is a network of narrow passageways, hidden chambers, and horrible smells. They ask that you take your shoes off at the manhole."
    ,7),
  ( 3
    ,"A"
    , "Celadon Cathedral"
    , "At the end of a dirt road leading into Celadon Forest stands a crumbling cathedral. Left to ruin for decades, dappled moonbeams fall through its collapsed spire, illuminating an abandoned organ rusting in the loft. Hikers in the forest have reported an inexplicably fast wi-fi connection, and sub-zero temperatures."
    ,6),
  ( 4
    ,"A"
    ,"Volcano Lair"
    ,"A network of tunnels and rooms carved into the walls of the volcano. Smoky clouds roll across its surface, coating the lair and everybody’s clothes in ash. Magma must be shovelled from the doorstep in the summer. Can get a bit chilly in the winter."
    ,7),
  ( 5
    ,"A"
    ,"Grimm's Gym"
    ,'Bone-chilling bangs and terrifying screams can be heard from outside the gym, striking fear into anyone who would dare enter. An intimidating array of musclebound villains can be found in this gym, dropping weights recklessly and crying out as they go for PBs. The vile fiends can be seen spotting one another, telling their lifter they have "one more" again after they just said "one more" on the last lift. Most arrests at the gym are made when the villains are doing their three sets of villainous poses in the mirror.'
    ,6),
  ( 6
    ,"B"
    , "Skull Shaped Mountain"
    , "A ginormous skull carved out of mountain in a protected nature reserve. This is probably where the good guys live."
    ,7),
  ( 7
    ,"B"
    , "Crimson Desert Oasis"
    , "Masked amidst a sea of mirages, an opulent oasis sits deep within the vast Crimson Desert. Wind swept dunes surround the base, a teal jewel in a bed of red. Near impossible to find without a guide, the only intruders to have breached the compound are the red sands tracked in by villainous boots."
    ,6),
  ( 8
    ,"B"
    , "Magnus Theatre"
    , "A long deserted independent movie theatre forgotten on the third floor of a slightly less abandoned apartment complex in the middle of the city. In a central location, the building is surrounded by busy streets and dark alleys. A humble love letter to cinema then, a great big projector for PowerPoints detailing villainous schemes now. The sound of explosions from films can still be heard, loud enough to rattle the apartments above and below, at least that's what the apartment manager says is causing it. The tenants don't mind it though, since the building wifi is inexplicably fast."
    ,5),
  ( 9
    ,"B"
    , "Coil Casino"
    , "Hypnotic lights lure penniless prey, promising shaky hands that this bet will be their last, as the monkey's paw curls. Above it all, the stakeholders stand behind velvet curtains woven with missed rents and retirement funds. The villains have a hideout in the back somewhere too. The police have raided the place a number of times, but they always walk past the monologuing villains to instead arrest the greedy investors. The villains hold hope that one day - the police will bring enough cuffs for them, too."
    ,6),
  ( 10
    ,"B"
    , "Freeman Prison"
    , "Once containing the world's most dangerous villains - now run by them. Built on Freeman Island, the facility reached a critical mass when the island was discovered to be more of a peninsula. Investors pulled out, layoffs happened, and the authorities were overthrown. The villains decided to make the prison their headquarters because they enjoyed the irony, and they just renovated solitary confinement."
    ,8),
  ( 11
    ,"C"
    , "Old Observatory"
    , "An old forgotten observatory resting atop a hill on the outskirts of the city. No longer the popular school excursion destination it once was. It’s high position and unique setup offer a great vantage point for villains to spot incoming intruders and meteorites."
    ,7),
  ( 12
    ,"C"
    ,"School Playground"
    ,"A true cesspool of despicable villainy. The scum plaguing this place wedgied one of our own data entry specialists... and it was really embarrassing for them."
    ,3),
  ( 13
    ,"C"
    , "Abandoned Water Park"
    , "Once a beloved water park frequented by children, now the residence of some much more manageable evil supervillains. Countless slides twist together into the sky like colossal springs, folding into one another like a tangled Slinkey capped by a makeshift penthouse of repurposed food trucks. The people cower in fear when the villains descend from their spiral tower, their collective “wee” echoing across the city."
    ,6),
  ( 14
    ,"C"
    , "Pillow Factory"
    , 'The villains residing here strike innocent passers-by with pillows before declaring "pillow fight!" This legally obligates the terrified civillian to combat. The helpless victims are then coerced to play Mario Kart, interrogated for what pizza they want to order, and forced to drink hot chocolate until they are knocked out cold on a high thread count pillow.'
    ,2),
  ( 15
    ,"C"
    , "Harbourside Warehouse"
    , "The scent of the sea fills this abandoned warehouse wedged in a once-bustling industrial port district. Now a hub of criminal activity, this warehouse has become warehome to many aspiring villains. A safe place to keep their hard-earned stolen goods, and to have a smoke where their mums can’t see."
    ,5);


DELETE FROM Villains;

-- Random order so students have to sort it
INSERT INTO Villains(TeamName, RealName, VillainName, Abilities, Status)
VALUES            ("Independent", "????", "Mr. Jenga", "Can telekinetically control bones.", "Active"),
      ("????", "Johnny Tex", "Freeze Tag", "Can freeze anything he touches, and radiates cold. Also immune to freezing of any kind. Loves to mention he's from Texas.", "Active"),
      ("Team 8", "Gavin Edgeworth", "Gravatro", "Can raise and lower gravity in areas of his choosing.", "Deceased"),
      ("????", "Maka Hirano", "Blasta la Vista", "A Demolition Expert, from fire crackers to napalm, this villain has it all. At 4 foot 9 they found a new way to make an impact. Their one weakness is being gently bumped into, triggering one of the many bombs in their pouches", "Active"),
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
      ("Team 2", "????", "Rat Run", "Can move at super speed, but only if no one can see him. At his strongest in total darkness.", "Active"),
      ("Team 1", "Smokington", "Smokey", "Invisibility, Morph into shadows, Immaterial", "Active"),
      ("Independent", "Rolo Peters", "Gacha Man", "Has a large dial on his chest which, when twisted, causes a gacha ball to pop out of his mouth. Opening it grants him a random ability for an hour. These abilities can stack and have varying levels of convenience, some might just be straight up hindrances.", "Active"),
      ("Independent", "????", "Bistro", "Deranged chef wielding a cleaver. Has boosted speed towards victims who have been seasoned.", "Active"),
      ("Team 5", "????", "Hellakinetic", "Can telekinetically control small objects with his mind.", "Active"),
      ("Team 1", "Valerie Bell", "Never Mist", "Summons a cloud she can ride and a sniper rifle of ice. The rifle fires ice bullets that melt after impact.", "Active"),
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

      DELETE FROM Witnesses;

      INSERT INTO Witnesses(BriefingID, Name, Occupation, Age, Gender, Statement)
      VALUES(1, "Sarah Lockingham", "Software Engineer", 28, "Female", "The observatory normally has centralised heating, but I remember my teeth chattering the whole evening"),
	(1, "David Wicker", "Astronomer", 54, "Male", "My mum packed my lunch for me that day and someone ate it!"),
	(2, "Penguin", "Penguin", 3, "Male", "Quack! Quack! Quack!"),
	(2, "Polar Bear", "Polar Bear", 12, "Female", "Mrs Bear bit off the interviewer's hand, and smacked the recording camera to the ground. Our cryptographers are still attempting to decipher the message"),
	(3, "Erik Darkstone", "Fry Cook", 17, "Male", "I tried running away, I can’t afford my health insurance premiums going up anymore if I got hurt, but the lady rescuing the criminals was too damn awesome. One of the guys took my shoe."),
	(3, "Sonny Blair", "Forgerer", 22, "Other", "I didn’t see anything, I was just there to get my passport renewed."),
	(3, "Frankie Hare", "Not Given", 33, "Male", "Hello World"),
	(4, "Sophia Berkavich", "Barrister", 25, "Female", "I know they said disco’s dead, but this is ridiculous!"),
	(4, "Sonya Texas", "Influencer", 31, "Female", "I was filming my next tick tock video when I saw my own back up dancers had been replaced those freaks! They hit their marks so I fired my other dancers and gave the zombies part time at $12/hour. Can you believe they bit me at my offer!"),
	(4, "Hank Clyde", "Propane Salesman", 64, "Male", "I didn’t see much, I’ve learnt to run away from any kooky sci-fi fantasy nonsense I see"),
	(5, "Victor Diabolus", "Medical Researcher", 59, "Male", "It was mine to use as I saw fit"),
	(5, "Brennen Mulligan", "Waiter", 22, "Male", "I work at the cafe across the street, the heat from the fire was like looking into the gates of hell, I think I saw something fly away, but there was so much smoke"),
	(6, "Sarah Carson", "Entrepreneur", 37, "Female", "And he cut in the line!"),
	(6, "Jenny Pitchers", "Retired", 75, "Female", "It was too much o' them videogames that made 'im like this."),
	(6, "Caesar Everie", "Unemployed", 25, "Male", "It was so scary!"),
	(7, "Christine Fine", "Barista", 30, "Female", "It was freezing in there!"),
	(7, "Sharan Moore", "Bank Worker", 27, "Female", "I was at my desk when a gush of wind went past behind me. When I looked to see what it was I saw a glimpse of someone wearing a bright red top."),
	(7, "Martin Jones", "Metalsmith", 34, "Male", "I was going to the bank to manage my account when coins started flying everywhere. It didn't look random though, it was like someone was controlling them."),
	(7, "Johnny Smith", "Not Given", 25, "Male", "I was walking past the bank when I saw a big explosion from the second floor. When it happened, this guy on a hoverboard made a beeline for the entrance. Weird."),
	(8, "Brett Olay", "Salesman", 49, "Male", "Did you know feeding bread to birds makes their stomachs explode?"),
	(8, "Ash Waterson", "Unemployed", 23, "Male", "Those birds are secret government spy drones and Dr. Birdbrain is their pawn."),
	(8, "Caesar Everie", "Unemployed", 25, "Male", "It was so scary!"),
	(9, "Tim Johnson", "Cobbler", 65, "Male", "My grandson always helps me with that rip in space-time stuff."),
	(9, "Blake Vass", "Accountant", 25, "Male", "I hate these dumb taking over the world pranks. Someone could get hurt!"),
	(9, "Caesar Everie", "Unemployed", 25, "Male", "It was so scary!"),
          (10, "Anna Peeters", "Kitchen Staff", 44, "Female", "I don’t really know what happened… I was at the kitchen sink looking out the window when I felt a gush of wind go past me, but when I turned around there was nothing behind me. You know its funny? My brother in law went through something really similar in the past, back in 2000."),
          (10, "Andre Jacobs", "Data Analyst", 36, "Male", "I work in the lower basements, where we hold the data centers. I definitely saw someone out of the ordinary down there, a lot of the lights had been knocked out, so I didn’t get a good look at their face, but when they saw me they jumped out the window, out onto the cliff side. I didn’t see any bodies out on the rocks, so I figured they got away."),
          (10, "Randal Holden", "Castle Guard", 22, "Male", "Well - huff - I was tied up for most of the attack - phew - sorry, I’m a bit out of breath. I saw a big guy knocking out lots of the guards, a real intimidating guy. When he was fighting he left tonnes of dents and imprints on the castle floor and walls. When I came into work I saw a weird looking van out front too, it had a lot of satellite dishes on top of it. I figured it was a news crew coming to do a segment on the ball the royal family was throwing, but after tonight I’m not too sure."),
          (10, "Becca Flanders", "Royal Seamstress", 45, "Female", "I wasn't anywhere near the scene of the crime, I didn't see anything. If you'll excuse me, one of the guards lost their uniform, I need to make them another one"),
          (11, "Frank Horrigan", "Super Villain", 32, "Male", "So you got me, big deal, we still completed our objective. If that Randal Rat and his hacker friend hadn't double crossed us I would've taken out every last one of you. I'm not worried though, my team will have me out before your body hits the floor. *NOTE: AT THIS POINT FRANK HORRIGAN BROKE OUT OF HIS BONDS*"),
          (11, "Mara Papa", "Writer", 33, "Female", "I'm afraid there wasn't that much that I was able to see, I saw someone with this scary metallic mask burst in through the window on their flying skateboard, and went straight into the security room. Then all the lights went off. There was lots of commotion, but I couldn't see anything else."),
          (11, "Stephen Peeters", "Musician", 30, "Male", "I was at the musuem, trying to get inspiration for my next song, when the lights went out. I felt this big whoosh go by me and I got knocked down, never saw what it was though."),
          (12, "John O'Leary", "Priest", 62, "Male", "Good heavens!"),
	(13, "Esther Josephine", "Retired", 65, "Other", "Well I never!"),
          (13, "Teleah Brassman", "Musician", 30, "Other", "One of the sheep ran into me, striking me with its wool. It felt quite pleasant."),
	(13, "Brody Kody", "Unemployed", 27, "Other", "Gnarly.");
