CREATE TABLE `Assets` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Outfit` varchar(255) NOT NULL,
  `Event` varchar(255) NOT NULL,
  `Display_Event` varchar(255) NOT NULL,
  `Date` date DEFAULT current_timestamp(),
  `BackPiece` tinyint(1) NOT NULL,
  `Alt` text NOT NULL
) 

ALTER TABLE `Assets`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `Assets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;


INSERT INTO `Assets` (`ID`, `Name`, `Category`, `Outfit`, `Event`, `Display_Event`, `Date`, `BackPiece`, `Alt`) VALUES
(1, 'SideCrown', 'Head', '', '', '', '2024-09-21', 0, 'A golden crown on Bo\'s (a cat mascot) right ear.'),
(2, 'Irajiack', 'Accessories', 'BosonaPumpkins', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pumpkin accessories resting in Bo\'s left paw. This pumpkin is in the shape of Irajiack\'s \"Bo Sona\" head '),
(3, 'Megan', 'Accessories', 'BosonaPumpkins', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pumpkin accessories resting in Bo\'s left paw. This pumpkin is in the shape of Megan\'s \"Bo Sona\" head'),
(4, 'Ryuzu', 'Accessories', 'BosonaPumpkins', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pumpkin accessories resting in Bo\'s left paw. This pumpkin is in the shape of Ryuzu\'s \"Bo Sona\" head'),
(5, 'Viridian', 'Accessories', 'BosonaPumpkins', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pumpkin accessories resting in Bo\'s left paw. This pumpkin is in the shape of Viridian\'s \"Bo Sona\" head'),
(6, 'Xen', 'Accessories', 'BosonaPumpkins', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pumpkin accessories resting in Bo\'s left paw. This pumpkin is in the shape of Xen\'s \"Bo Sona\" head'),
(7, 'MicrophoneLeft', 'Accessories', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A microphone accessories on Bo\'s left paw.'),
(8, 'MicrophoneRight', 'Accessories', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A microphone accessories on Bo\'s right paw.'),
(9, 'Vines', 'Arms', 'JackOLantern', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A vines costume part of the Jack O\' Lantern costume that is placed around Bo\'s arms and make a tiny bow on Bo\'s chest'),
(10, 'WristBand', 'Arms', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A white wrist band on the left arm of Bo from the Pop Star costume'),
(11, 'SunnyPlain', 'Backgrounds', '', '', '', '2024-09-21', 0, 'A background of a glassy plain with a very cartoon drawn sun in the top left corner and some clouds in the sky.'),
(12, 'PumpkinPatch', 'Backgrounds', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The background of a Pumpkin patch with some hay bale here and there.'),
(13, 'Regular', 'Onesies', 'Ghost', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The Oneside of a Ghost costume covering Bo entierly with only 2 holes for the eyes.'),
(14, 'Body', 'Body', 'JackOLantern', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The no face body of the Jack o\' Lantern costume that is a giant pumpkin.'),
(15, 'BodyBoFace', 'Body', 'JackOLantern', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The \"Bo\'s face\" body of the Jack o\' Lantern costume that is a giant pumpkin with Bo\'s face drawn in black..'),
(16, 'BodyRegularFace', 'Body', 'JackOLantern', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The \"Regular smiley face\" body of the Jack o\' Lantern costume that is a giant pumpkin with a smiley very carved pumpkin essance drawn in black..'),
(17, 'BodySharpFace', 'Body', 'JackOLantern', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The \"Sharp smiley face\" body of the Jack o\' Lantern costume that is a giant pumpkin with a smiley very carved pumpkin essance drawn in black..'),
(18, 'CropTop', 'Body', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The white crop-top of the costume Pop-star'),
(19, 'PinkTutu', 'Legs', '', '', '', '2024-09-21', 0, 'A bink tutu resting on Bio\'s hips.'),
(20, 'Shoes', 'Feet', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The perfectly white pair of shopes of the Pop-star costume.'),
(21, 'Hat', 'Head', 'JackOLantern', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The Hat of the Jack O\' lantern costume which is the top of a pumpkin with a branch and a vine going over Bo\'s face on the left.'),
(22, 'Vines', 'Legs', 'JackOLantern', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Vines of the Jack O\' Lantern costume that span trough both legs and make a bow on Bo\'s hips topped with tiny orange shoes.'),
(23, 'Shorts', 'Legs', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The pair of white shorts with the black belt of the Pop-star costume.'),
(24, 'BestCostumeTrophy', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'An accessories on Bo\'s Right hand titled Best Costume which is a golden trophy with candies in.'),
(25, 'GlowstickLeftBlue', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A blue glow stick accessories on Bo\'s left paw. '),
(26, 'GlowstickLeftGreen', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A green glow stick accessories on Bo\'s left paw. '),
(27, 'GlowstickLeftPink', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pink glow stick accessories on Bo\'s left paw. '),
(28, 'GlowstickLeftYellow', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A yellow glow stick accessories on Bo\'s left paw. '),
(29, 'GlowstickRightBlue', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A blue glow stick accessories on Bo\'s right paw. '),
(30, 'GlowstickRightGreen', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A green glow stick accessories on Bo\'s right paw. '),
(31, 'GlowstickRightPink', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pink glow stick accessories on Bo\'s right paw. '),
(32, 'GlowstickRightYellow', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A yellow glow stick accessories on Bo\'s right paw. '),
(33, 'GlowstickNecklaceBlue', 'Neck', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A blue glow stick necklace around Bo\'s neck. '),
(34, 'GlowstickNecklaceGreen', 'Neck', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A green glow stick necklace around Bo\'s neck. '),
(35, 'GlowstickNecklacePink', 'Neck', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pink glow stick necklace around Bo\'s neck. '),
(36, 'GlowstickNecklaceYellow', 'Neck', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A yellow glow stick necklace around Bo\'s neck. '),
(37, 'PBSandwish', 'Accessories', 'Jay', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The accessories for Jay\'s (Inkblot founder) costume which is a Peanut+Jelly sandwich in Bo\'s left paw.'),
(38, 'BosonaParty', 'Backgrounds', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A background featuring the Inksters Bo\'s sona in various costume and position. Background left is Irajiack\'s Bo Sona in an Alloy from the game Horizon costume. Front left is Megan Bo Sona in a Hatsune Miku the Vocaloid costume stroking a conversation with Ryzu Bo Sona in a Jorato costume from Jojo\'s bizzare adventure anime/manga serie. On the left middle side is Veridian Bo Sona in a Link from the Legend of Zelda game serie talking with Xen\'s Bo Sona in a Card Captor sakura costume from the Anime/Manga Card Captor Sakura.'),
(39, 'DragonOnesie', 'Onesies', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A red dragon onesie featuuring a beige belly, beige wing membrane and beige horns.'),
(40, 'Shirt', 'Body', 'HatsuneMiku', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The shirt of the iconic Vocaloid Hatsune Miku costume.'),
(41, 'Shoes', 'Feet', 'HatsuneMiku', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The shoes of the iconic Vocaloid Hatsune Miku costume.'),
(42, 'Skirt', 'Legs', 'HatsuneMiku', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The skirt of the iconic Vocaloid Hatsune Miku costume.'),
(43, 'Hair', 'Hair', 'HatsuneMiku', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The hair of the iconic Vocaloid Hatsune Miku costume.'),
(44, 'Sleeves', 'Arms', 'HatsuneMiku', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The sleeves of the shirt of the iconic Vocaloid Hatsune Miku costume.'),
(45, 'headphones', 'Neck', 'Jay', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pair of red headphone sporting Inkblot\'s logo, the red buttefly from Jay\'s (Inkblot Founder) costume'),
(46, 'sprout', 'Head', 'Jay', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A tiny green sprout as a head accessory from Jay\'s (Inkblot\'s founder) costume'),
(47, 'Necklace', 'Neck', 'Howl', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The golden and purple gem necklace of Howl in Howl\'s Moving Caste movie from Studio Ghibli.'),
(48, 'Tai', 'Tai', 'Howl', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Tai costume being a onesie of Calcifer from Howl\'s Moving Caste movie from Studio Ghibli.'),
(49, 'Shirt', 'Body', 'Howl', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The white-beige puffy shirt of Howl from Howl\'s Moving Caste movie from Studio Ghibli.'),
(50, 'Shoes', 'Feet', 'Howl', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The black shoes of Howl from Howl\'s Moving Caste movie from Studio Ghibli.'),
(51, 'BlondHair', 'Hair', 'Howl', 'Halloween2024', 'Halloween 2024', '2024-09-21', 1, 'The blond version of Howl\'s hair from Howl\'s Moving Caste movie from Studio Ghibli.'),
(52, 'BlackHair', 'Hair', 'Howl', 'Halloween2024', 'Halloween 2024', '2024-09-21', 1, 'The black version of Howl\'s hair from Howl\'s Moving Caste movie from Studio Ghibli.'),
(53, 'Pants', 'Legs', 'Howl', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The black pair of pants of Howl\'s from Howl\'s Moving Caste movie from Studio Ghibli.'),
(54, 'Jacket', 'Shoulders', 'Howl', 'Halloween2024', 'Halloween 2024', '2024-09-21', 1, 'The colorful jacket of Howl from Howl\'s Moving Caste movie from Studio Ghibli.'),
(55, 'bow', 'Head', 'Kiki', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The pink bow of Kiki from Kiki\'s Delivery Service movie from Studio Ghibli.'),
(56, 'Shoes', 'Feet', 'Kiki', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The brown shoes of Kiki from Kiki\'s Delivery Service movie from Studio Ghibli.'),
(57, 'Dress', 'Body', 'Kiki', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The black dress of Kiki from Kiki\'s Delivery Service movie from Studio Ghibli.'),
(58, 'DressBlue', 'Body', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A clear blue dress for the princess costume.'),
(59, 'DressPink', 'Body', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A soft pink dress for the princess costume.'),
(60, 'DressPurple', 'Body', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A soft purple dress for the princess costume.'),
(61, 'ShoesBlue', 'Feet', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The clear blue high heels shoes of the princess costume.'),
(62, 'ShoesPink', 'Feet', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The soft pink high heels shoes of the princess costume.'),
(63, 'ShoesPurple', 'Feet', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The soft purple high heels shoes of the princess costume.'),
(64, 'TiaraBlue', 'Head', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A clear blue tiara of the princess costume.'),
(65, 'TiaraPink', 'Head', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A soft pink tiara of the princess costume.'),
(66, 'TiaraPurple', 'Head', 'Princess', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A soft purple tiara of the princess costume.'),
(67, 'Head', 'Makeup', 'Skeleton', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A cartoonish skull makeup for the skeleton costume.'),
(68, 'Pants', 'Makeup', 'Skeleton', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A cartoonish legs skeleton makeup for the skeleton costume.'),
(69, 'Shirt', 'Makeup', 'Skeleton', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A cartoonish chest skeleton makeup for the skeleton costume.'),
(70, 'Bow', 'Neck', 'JiJi', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Jiji\'s Bow from Kiki\'s Delivery Service movie from Studio Ghibli.'),
(71, 'WhiskersEars', 'Accessories', 'JiJi', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Jiji\'s ears and whiskers from Kiki\'s Delivery Service movie from Studio Ghibli.'),
(72, 'HauntedHouse', 'Backgrounds', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A haunted house background, displaying a green scary ghost on the left side coming from the mirror. The windows in the background are barely covered by ripped red curtains. The floor seems to be a layer of paint chipping from the wood with a carpet. The overall night mood is portrayed with a mostly blue leaning color scheme.'),
(73, 'Bag', 'Accessories', 'Fairy', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A tiny satchel resting on Bo\'s right side of their hips with the shoulder strap being made of vines for the Fairy costume.'),
(74, 'Wings', 'Accessories', 'Fairy', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Semi transparent golden fairy wings for the Fairy costume'),
(75, 'Head', 'Head', 'Fairy', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A crown of flowers wrapped around Bo\'s left ear.'),
(76, 'Pants', 'Legs', 'Fairy', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The green pants with the semi-transparent golde frill at the bottom for the Fairy costume.'),
(77, 'Shirt', 'Body', 'Fairy', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The shirt is bi color with green on the low half part and a beige-yellow color for the top half part. The collar and what is separating the shirt top from bottom are green leaves. For the Fairy costume.'),
(78, 'Onesie', 'Onesies', 'DinoNugget', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The onesie of a Dino nugget costume showing the color and grain of fried nuggets.'),
(79, 'Bottles', 'Accessories', 'DinoNugget', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'The accessories that goes with the dino nugget onesie; A mustard bottle squirting mustard on the left hand and a ketchup buttole squirting ketchup on the right side.'),
(80, 'side', 'Tai', '', '', '', '2024-09-21', 0, 'Tai displayed on the right side of Bo.'),
(81, 'neck', 'Tai', '', '', '', '2024-09-21', 0, 'Tai displayed under Bo\'s neck like a red bowtie.'),
(82, 'Tai', 'Tai', 'DinoNugget', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Tai on the left side of Bo holding a stegosaurus dino nugget that has a sprout on it\'s head. And a pterodactyl nugget that has sunglasses on the right.'),
(83, 'Tai', 'Tai', 'Ghost', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Tai in a ghost costume that is a pure white sheet with 2 round holes for the eyes.'),
(84, 'Tai', 'Tai', 'HatsuneMiku', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Tai in a Hatsune Miku costume displaying Miku\'s tie and the shoulder bands.'),
(85, 'Tai', 'Tai', 'Prince', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Tai displaying the costume of a prince; A golden crown with a red cape.'),
(86, 'Tai', 'Tai', 'Skeleton', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Tai having the skeleton makeup displaying a face with random bones.'),
(87, 'BlueGradient', 'Backgrounds', '', '', '', '2024-09-21', 0, 'A blue gradient for background.'),
(88, 'GreenGradient', 'Backgrounds', '', '', '', '2024-09-21', 0, 'A green gradient for background.'),
(89, 'OrangeGradient', 'Backgrounds', '', '', '', '2024-09-21', 0, 'An orange gradient for background.'),
(90, 'HalloweenPattern', 'Backgrounds', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A set of orange halloween patterns for background displaying the following: ghost, smily carved pumpkin, wrapped candies, bats, witch hats, sparkles, candles and vampire teeth.'),
(91, 'Onesie', 'Onesies', 'Bee', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A bee oneside for Bo'),
(92, 'PawPads', 'Makeup', 'Bee', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Golden paw pads for Bo from the Bee costume.'),
(93, 'SharpSmiley', 'Accessories', 'PumpkinBasket', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pumpkin basket filled with candy displaying a sharp smiley face.'),
(94, 'ClosedEyes', 'Accessories', 'PumpkinBasket', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A pumpkin basket filled with candy displaying a eyes closed smiley face.'),
(95, 'Boots', 'Feet', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A red hip high pair of boots for the Pop-star 2 costume.'),
(96, 'Necklace', 'Neck', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A black string with a red stone as necklace for the pop-star 2 costume.'),
(97, 'Skirt', 'Legs', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A purple pink with a red star on the right side of Bo\'s hip from the Pop-star 2 costume'),
(98, 'Shirt', 'Body', 'PopStar', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'A purple shirt to match the skirt from the Pop-star 2 costume.'),
(99, 'Hearts', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Floating red hearts around Bo\'s head.'),
(100, 'Sparkles', 'Accessories', '', 'Halloween2024', 'Halloween 2024', '2024-09-21', 0, 'Floating golden sparkle around Bo.');