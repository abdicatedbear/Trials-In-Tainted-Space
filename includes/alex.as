/*FIRST TIME INTRO
[No]
[Yes]
[Flirt]
[Yes]
[No]
[What are you?]
[Yes]
[More]
[Bail]
REPEAT INTRO (you didn’t tap that)
[Androgyne]
[Flirt]
[What are you]
[Bail Again]
REPEAT INTRO (You tapped that (or bailed at the last minute))
[Alex]
[Sex]
[Talk]
SEX (FUCKING FINALLY)
Aside: BUT WHAT DO DICK SIZES MEAN TO ALEX?
[Pitch Vaginal]
[Catch Vaginal]
[Frottage]
[Catch Anal]
[Bail Once More]*/

//FIRST TIME INTRO
function alexManHermIntro():void {
	if(flags["FUCKED_ALEX"] == undefined && flags["MET_ALEX"] == undefined) output("\n\nYour attention is drawn by a tall and very pretty… Man? Woman? A very pretty person leaning against the bar, clad in baggy pants tucked into boots and a strip of cloth wrapped tightly around their very flat chest. That combined with the close-cropped hair and slight but noticeable muscle tone makes you want to say it’s a man, but their lithe, narrow waist and flared hips imply otherwise. Before you can make a call, the person in question flashes you a brilliant smile your way and beckons you over.");
	else if(flags["FUCKED_ALEX"] == undefined && flags["LAST_MINUTE_ALEX_BACK_OUT"] == undefined) output("\n\nIt looks like that androgynous man from before is around again.");
	else 
	{
		output("Your ");
		if(flags["FUCKED_ALEX"] != undefined) output("fuck-");
		output("buddy Alex is hanging out in his usual spot at the bar, drinking something fruity looking and casting occasional lascivious glances your way.");
	}
	//Do you approach?
	//[Yes] [No]
	userInterface.addButton(1,"Androgyne",approachAlex);
}

function approachAlex():void {
	if(flags["MET_ALEX"] == undefined) approachAlexTheFirstTime();
}

//[No]
//Androgyny isn’t really your scene, or maybe you’re just not in the mood right now. You wave back and shake your head {politely/dismissively}. They seem to take it pretty well, either way.
//	(Add “Androgyne” button when standing around the bar and go to repeat intro)

//[Yes]
function approachAlexTheFirstTime():void {
	clearOutput();
	flags["MET_ALEX"] = 1;
	output("Why not? Looks like it could lead to a good time and even if not you might get to sate your curiosity at the very least. You make your way over and lean against the bar with your new companion.");
	output("\n\n“<i>Hey,</i>”  he says, because that’s definitely a male voice, though even up close it’s still pretty hard to tell just by looking at him. “<i>Like what you see? Or are you just here for the conversation?</i>”  The prettyboy winks, still grinning broadly and not at all subtly eyeing your assets in turn.");
	processTime(1);
	//[Flirt] [What are you?] [Bail]
	userInterface.clearMenu();
	userInterface.addButton(0,"Flirt",flirtWithAlex);
	userInterface.addButton(1,"WhatAreYou?",askAlexWhatHeIs);
	userInterface.addButton(2,"Bail",bailOnAlex);
}

//[Flirt]
function flirtWithAlex():void {
	clearOutput();
	output("You grin back and tell him that you’re certainly not going to complain about the view. He laughs.");
	output("\n\n“<i>Well, you’re not so bad yourself. Always had a healthy appreciation for ");
	if(pc.biggestTitSize() < 1) output("a nice, toned chest");
	else if(pc.biggestTitSize() <= 4) output("a healthy handful");
	else output("an overflowing cup");
	output(", if you know what I’m saying.</i>”  The suggestive way he caresses his own chest makes it abundantly clear what, exactly, he’s saying. “<i>And of course a " + pc.mfn("pretty face","strong jaw","pretty face with a strong jaw") + " certainly doesn’t hurt.");
	//if masculine and breasts > C cup OR feminine and breasts = flat: 
	if(pc.mf("man","woman") == "man" && pc.biggestTitSize() >= 3 || pc.mf("","f") == "f" && pc.biggestTitSize() < 1) output(" Nice to see other people out there willing to mix and match too, so to speak.");
	output("</i>”");

	output("\n\nYour new friend leans in, a particularly wolfish smile on his face.");

	output("\n\n“<i>What do you say we cut to the chase and head up to my room for some fun?</i>”");
	processTime(2);
	//if taur with back mounted bits:
	if(pc.isTaur() || pc.isDrider()) 
	{
		output("  A thought seems to strike him after he says this, however, and he crouches momentarily to try to get a good look at your undercarriage. “<i>Though, uh. To be honest I’m not sure I’m exactly equipped to handle you. Sorry, but you might wanna look elsewhere.</i>”  He has the graces to look apologetic about it, at least. You get the feeling you’re not getting much of anything out of this guy.");
		
		//(kick back to bar menu)
		userInterface.clearMenu();
		userInterface.addButton(0,"Next",mainGameMenu);
		return;
	}
	//[Yes] [No]
	userInterface.clearMenu();
	userInterface.addButton(0,"Yes",alexSexMenu);
	userInterface.addButton(1,"No",noToAlyxSex);
}
//[Yes]
//(GO TO SEX)

//[No]
function noToAlyxSex():void {
	clearOutput();
	output("This guy seems nice, if a little cocky, but you’re not really feeling it. You decline ");
	if(pc.isNice()) output("as politely as you can manage");
	else output("bluntly");
	output(" and he shrugs.");

	output("\n\n“<i>Suit yourself,</i>”  he says, seeming to take your rejection in stride. “<i>I’ll be around if you change your mind, though.</i>”");
	//(Add “Androgyne” button when standing around the bar and go to repeat intro)
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

//[What are you?]
function askAlexWhatHeIs():void {
	clearOutput();
	output("For a moment the guy actually looks surprised and almost a little taken aback, but before you can say anything else he’s started laughing. “<i>Well, aren’t you straightforward?</i>”  he says, sounding more bemused than anything else. “<i>I’m guessing you mean in terms of what I’m packing, yeah?</i>”");
	output("\n\nYou nod, saying that that’s about the gist of it.");

	output("\n\n“<i>Well, this thing,”  he pulls down the cloth wrapped around his torso slightly, revealing a very flat but well-toned chest and giving you a good long look before pulling it back into place. “<i>Isn’t for decency’s sake. I like to think of myself as a man, but to tell you the truth? Downstairs I’m packing a little bit of both. Why limit myself to having half as much fun, right?</i>”  He leans back against the counter, giving you a very self-satisfied smile.");
	output("\n\n“<i>So, is that enough to answer your question or are you interested in learning a bit more?</i>”  The pointed way in which he looks you up and down when he says ‘more’ gives you the impression that he’s talking about a very hands-on sort of demonstration.");
	processTime(3);
	if(pc.isTaur() || pc.isDrider()) 
	{
		output("\n\nA thought seems to strike him after he says this, and he crouches momentarily to try to get a good look at your undercarriage. “<i>Though, uh. To be honest I’m not sure I’m exactly equipped to handle you. Sorry, but you might wanna look elsewhere.</i>”  He has the graces to look apologetic about it, at least. You get the feeling you’re not getting much of anything out of this guy.");
		//(kick back to bar menu)
		userInterface.clearMenu();
		userInterface.addButton(0,"Next",mainGameMenu);
		return;
	}
	output("\n\nWhat do you say?");
	//[Yes] [More]
	userInterface.clearMenu();
	userInterface.addButton(0,"More Please",morePleaseAlex);
	userInterface.addButton(1,"That'sEnough",thatsEnoughAlex);
}
//[More]
//(GO TO SEX)

//[Yes]
function thatsEnoughAlex():void {
	clearOutput();
	output("Yeah, that’s about all the information you were after. The prettyboy looks more than a little bit disappointed, but his seemingly ever-present grin is back on again quickly enough.");
	output("\n\n“<i>Suit yourself,</i>” he says, shrugging. “<i>I’ll be around if you ever change your mind, though.</i>”");
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

//[Bail]
function bailOnAlex():void {
	clearOutput();
	output("Come to think of it, this guy isn’t really your type. You make some pleasant small talk for a little while before making your excuses and going back to your business.");
	//(Add “Androgyne” button when standing around the bar and go to repeat intro)
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}


//REPEAT INTRO (you didn’t tap that)
function repeatApproachAlex():void {
	clearOutput();
	output("You make your way over to the man once again.");

	output("\n\n“<i>Hey,</i>”  he says. “<i>Looking for a good time?</i>”");
	if(pc.isTaur() || pc.isDrider()) 
	{
		output("  A thought seems to strike him after he says this, and he crouches momentarily to try to get a good look at your undercarriage. “<i>Though, uh. To be honest I’m not sure I’m exactly equipped to handle you. Sorry, but you might wanna look elsewhere.</i>”  He has the graces to look apologetic about it, at least. You get the feeling you’re not getting much of anything out of this guy.");
		//(kick back to bar menu)
		userInterface.clearMenu();
		userInterface.addButton(0,"Next",mainGameMenu);
		return;
	}
	//[Flirt] [What are you?] [Bail Again]
	//9999
}

//[Flirt]
//(GO TO SEX)

//[What are you]
//(Only available if not asked previously, go to above)

//[Bail Again]
function bailOnAlexAgain():void {
	clearOutput();
	output("You’re still not really into this kind of genderfuck stuff, and ");
	if(pc.isNice()) output("try to let him down gently");
	else output("tell him so");
	output(". He looks pretty disappointed, but shrugs it off easily enough.");

	output("\n\n“<i>Suit yourself,</i>”  he says, shrugging. “<i>I’ll be around if you ever change your mind, though.</i>”");
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

//REPEAT INTRO (You tapped that (or bailed at the last minute))
function approachAlexAfterHavingSexOrAlmostHavingSex():void {
	clearOutput();
	//(Slip this in after the room description for the bar or however we’re handling NPCs wandering around in this game)
	output("You decide to pay Alex a visit.");
	output("\n\n“<i>Hey, [pc.name],</i>”  he says, grinning broadly at you. “<i>Taking a break from your busy life to visit little old me? You shouldn’t have.”  He laughs, maybe a little more enthusiastically than is called for, and the two of you share some idle conversation.");
	output("\n\n“<i>So,</i>”  he asks, once the ice is sufficiently broken. “You up for another round, or did you just come here to talk?”");
	//[Sex] [Talk]
	//9999
}

//[Sex]
//(GO TO SEX)

//[Talk]
function talkToAlex():void {
	clearOutput();
	//(Maybe there’ll be actual content here eventually but damn it I’m writing a fuckbuddy not a husbando)
	output("You tell Alex you’re good with just spending some fully-clothed, pants-on, platonic friends time with him.");
	output("\n\n“<i>Cool with me</i>,”  he says, shrugging. “<i>You’re a good fuck, but if I’m going to be totally honest here you outclass most of the folks around here in conversation too</i>.”");
	output("\n\nYou and Alex spend some ");
	if(silly) output("fully-clothed, pants-on platonic friends ");
	output("time together, chatting about your various adventures before you realize you need to get going and say your goodbyes.");
	processTime(10+rand(3));
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

//SEX (FUCKING FINALLY)
function alexSexMenu():void {
	clearOutput();
	output("You tell him you think you’re up to it if he is.");
	output("\n\n“<i>Great,</i>”  he says, grin widening as he shoves a hand in his pocket and fishes around for a bit before pulling out a key. “<i>Head on up to my room and get yourself ready while I try to flag down the bartender so I can pay off my drink.</i>”");
	if(silly) output("  Wow, what a trusting guy. You think about stealing his room key for a little while before deciding against it. Theft would be way too annoying to implement just for a scene like this.");

	output("\n\nFeeling your ");
	if(pc.hasVagina() && pc.hasCock()) output("[pc.vaginas] slicken and [pc.cocks] harden");
	else if(pc.hasVagina()) output("[pc.cunts] slicken");
	else if(pc.hasCock()) output("[pc.cocks] harden");
	else output("body grow hot");
	output(" with anticipation, you head up the stairs and find your new friend’s room and head inside. It’s not really all that impressive, but given the state of this place in general that’s not a big surprise, and all that matters right now is that the bed looks comfortable enough. You’re just about out of your [pc.gear] when you hear a knock on the door and turn around to see ");
	if(9999 == 9999) output("your partner");
	else output("Alex");
	output(" peeking in. He whistles appreciatively.");

	//{If first time boning Alex (or if first time since changing genital configuration if that’s not too much of a bitch to code):
	if(flags["FUCKED_ALEX"] == undefined) {
		var he:String = mfn("he","she","meh");
		//If herm:
		if(pc.hasCock() && pc.hasVagina())
		{
			output("\n\n“<i>I see someone else is big on batting for both teams,</i>”  he laughs, shutting the door behind him. “<i>Oh yeah, we’re going to have some fun.</i>”");
		}
		//If dick & masculine:
		else if(pc.hasCock() && he == "he")
		{
			output("\n\n“<i>Wow,</i>”  he says, shutting the door behind him as he admires your [pc.cocks].");
			if(pc.longestCockLength() <= 5.5) output(" “<i>You know, I’ve gotta say that living in a galaxy full of people splicing up to try and get the biggest, thickest dick has really made me appreciate the little things in life.</i>”  You roll your eyes as he takes a moment to laugh at his own joke. At least he seems to be into it.");
			else if(pc.longestCockLength() <= 10) output(" “<i>Call me old fashioned, but there’s almost nothing I love more than a good dick. And you, sir, have got a good dick.</i>”");
			else if(pc.longestCockLength() <= 18) output(" “<i>You’re quite the catch. I really hope you’re planning on fucking me with that, damn. Been a while since I had anything that big.</i>”");
			else output(" “<i>Holy fuck. Okay, I’m pretty flexible, but that’s going to take some work. Wow. How long did you have to work at getting it that big?</i>” You say you’ll tell him later, when there aren’t more pressing issues at hand.");
			output("\n\n“<i>Yeah, right, I figure you didn’t exactly come up here to tell me your life story,</i>” he says, shaking off his surprise.");
		}
		//If dick & feminine:
		else if(pc.hasCock() && (he == "meh" || he == "she"))
		{
			output("\n\n“<i>Never would’ve guessed that,</i>”  he says, shutting the door behind him as he admires your [pc.cocks].  “<i>Not that I’m complaining, of course. Who isn’t into ");
			if(pc.biggestTitSize() >= 1) output("chicks with dicks");
			else output("beautiful men");
			output(", am I right?</i>”");
		}
		//If pussy & feminine:
		else if(pc.hasVagina() && pc.mf("","she") == "she")
		{
			output("\n\n“<i>Wow,</i>”  he says, shutting the door behind him as he admires you from top to bottom");
			if(silly) output(" but mostly focusing on your [pc.chest]");
			output(". “<i>Call me old fashioned, but I’ve never been able to say no to a classic beauty like you.</i>”");
		}
		//If pussy & masculine:
		else if(pc.hasVagina()) {
			output("\n\n“<i>Wow,</i>” he says, shutting the door behind him as he admires you from top to bottom. “<i>You know, you don’t see a lot of people rocking that combo around. Chicks with dicks are a dime a dozen, but man do I love guys with cunts.");
			if(pc.biggestTitSize() > 2) output(" Not about to complain about your tits, either.");
			output(" Damn.</i>”");
		}
		//If genderless:
		else {
			output("\n\n“<i>Huh,</i>”  he says, shutting the door behind him and looking pretty damn puzzled. “<i>Well.</i>”  There’s a long, awkward moment where he just stares at you with a look on his face like he’s trying to work out some complex math problem. You sigh and ask if there’s something wrong.");
			output("\n\n“<i>No, no, I’ve got this,</i>”  he replies, not seeming wholly convinced himself but determined to rise to the challenge nonetheless. After another pause for consideration his cocky smile is firmly affixed on his face once again. “<i>Yeah, I’ve got this. Sorry, It’s just not every day I see something new, you know?</i>”  You concede that your attributes, or lack thereof, are pretty out of the ordinary.");
		}
	}
	output("\n\n“<i>So,</i>” he says, wasting no time in stripping out of his own clothes to reveal an already-hard, seven-inch human cock and two full, golfball-sized testicles. “<i>What are you waiting for?</i>”");
	output("\n\nYou ");
	if(pc.legCount > 1) output("stride");
	else output("slither");
	output(" forward confidently, wrapping your arms around his ");
	if(pc.tallness > 72) output("girly waist");
	else output("shoulders");
	output(". He seems to melt against you, more than pleased to let you take the lead as you maneuver him around so his back is to the bed and push him down. Moaning lustily into your mouth, he arches his back to press his flat, muscular chest against your [pc.chest]");
	if(flags["FUCKED_ALEX"] == undefined) 
	{
		output(" before stopping abruptly.");
			output("\n\n“<i>Shit<i>,” he says, pulling out of your lip-lock. “<i>Where’s my manners? My name’s Alex.” He offers you a hand, which you take despite your mild confusion. Surprisingly, given everything else about him, his handshakes are very firm and manly. You introduce yourself in kind. “<i>Well it’s nice to meet you, [pc.name]. Not that I expect this to be much more than a wham, bam, thank you ma’am, but it’s just nice to know who you’re fucking, right?</i>”  Before you can respond, he’s pulled you back into a passionate kiss.");
	}
	output("\n\nYou explore Alex’s mouth with your tongue, tasting the last remnants of whatever fruity thing he’d been drinking before sneaking off with you and enjoying the low rumble of his moans against your [pc.lips] as he wriggles under you, gently pressing a knee up ");
	if(pc.hasStatusEffect("")) output("against your genital slit");
	else if(pc.isTaur() || pc.isGoo()) 
	{
		output("against where your torso meets your ");
		if(pc.isGoo()) output("soft, gel-like");
		else output("animalistic");
		output(" lower half");
	}
	else if(pc.hasVagina()) output("soaked netherlips");
	else if(pc.hasCock()) output("nearly unbearable hardness");
	else output("between your thighs");
	output(".");

	output("\n\n“<i>So,</i>” he murmurs, “<i>How do you want to do this?</i>”");
	//[Pitch Vaginal] [Catch Vaginal] [Frottage] [Catch Anal] [Bail Once More]
	//Pitch Vaginal is available to all dickhavers as long as their dicks are between their front set of legs.
	//Catch Vaginal is available to all vagina havers as long as their pussies are between their front set of legs until I go back and write a taur version.
	//Frottage isn’t written yet because I’m a lazy asshole.
	//Catch Anal is fun for everyone.
	
	userInterface.clearMenu();
	//9999

	//Aside: BUT WHAT DO DICK SIZES MEAN TO ALEX?
	//That’s a good fucking question. This kind of game makes all sense of scale kind of fly out the window for me a bit so I’m not really sure. Call small dicks anything five inches or shorter unless they’re super thick, medium anything from six inches to a foot long, and big anything bigger than that. HUGE is probably something equivalent to being triple- or quadruple-fisted or something? I’d give you numbers but I don’t remember the cockarea equations offhand ever since we stopped assuming dicks were box-shaped, and also don’t want to have to do extensive dick math.

	//I don’t know when he stops being able to fit your dicks inside of him. I tried figuring out how big the pelvis is but then I remembered that no you can totally fit stuff bigger than an infant inside you back in CoC without worrying about your pubic symphysis even if you’ve got no hips so who knows. I leave it up to someone better at hyper than me.
}






[Pitch Vaginal]
(Available to all dickhavers)
If none of your cocks fit:
Alex glances back and forth between your [cock/s] and his comparitively small frame a few times, looking concerned.

“<i>I don’t think this is gonna work,</i>” he says, hesitantly. “<i>Like, if I thought it was at all possible I’d be thrilled to give it a shot, but I’m not exactly a rahn, you know?</i>” With an expression of intense disappointed longing on his face, he reaches out and pats your [biggest dick] as if to check if something that huge could really be real.

“<i>Don’t you get dizzy every time you pop a boner or something? Wow. Anyway, is there anything else you wanna try? I’m up for just about anything.”
(sex menu with all applicable options except Pitch Vaginal)

If one fits:
You tell Alex to get on all fours and present himself to you; a command with which he happily complies, rolling over onto his stomach and quickly getting his knees under him so his full, heart-shaped butt is up in the air. His pussy, previously hidden from view by his cock and balls, is soaking wet and drooling down his thighs {if high wetness: though it’s nothing compared to yours}. Running two fingers teasingly up and down the length of his slit and giving special attention to the small, hard nub of his clit, you ask him if he’s ready for you.

“<i>Yes,</i>” he gasps, voice hitching up to an almost feminine key. “<i>Yes, stop teasing, I need this.</i>”

Grinning, you withdraw your hand and give his ass an appreciative slap, pleased to see how well it jiggles. Alex just whimpers and wiggles his hips back and forth, trying to tempt you into taking action instead of taunting him any further. It certainly proves an effective tactic, and you find yourself with your hands gripping his wide, womanly hips as you align your [cockthatfits] with his slick folds.
If small dick:
You slide easily into his experienced cunt {if balls: [balls] slapping wetly against his throbbing clit}. He’s loose around you but he moans nonetheless, apparently very turned on by the feeling of your [head] rubbing against his well-used walls, and after a moment to adjust he’s able to clench down on your [cockthatfits] surprisingly well.
if medium dick:
Slowly, wanting to draw this out as much as possible, you press your [cockthatfits] inch by inch into his cunt, enjoying every ripple and spasm as he moans and tries to buck back against you for more. You’ve got your own ideas, though, and hold his hips steady until you’re fully sheathed inside of him, [head] pressed against his cervix {if balls: and [balls] slapping wetly against his throbbing clit}.
if big or HUGE dick:
It takes a few tries, sliding the [head] of your [cockthatfits] up and down his netherlips until the combination of your {if high cum volume: copious} precum and his lady juices gets you wet enough to finally press in. Alex gasps as your massive head passes the comparatively tight entrance of his cunt, fingers tangling into the sheets as he’s stretched to capacity.
if HUGE dick:
Actually feeling a little concerned, you ask if he’s going to be okay.

“<i>Fffffuck yeah,<i>” he hisses through gritted teeth. “<i>Never better. Holy shit.</i>” Good enough for you, you think, before getting back to your business.
He’s tight, wonderfully tight to the point that you can actually feel his pulse pounding through the wet, hot walls of his pussy, and that’s just with the tip inside. You moan and ease in, stretching his already loose cunt even further, bit by bit until your cockhead is pressed flush against his cervix.} (DICK VIRGINITY CHECK)

You let him rock back against you for a little while, leaning forward and {if breasts > B cup: squishing your [breasts] against his back {if milk:, smearing your [milk] across his shoulders}/if not: pressing your [pc.chest] against his back} while you tweak his small, perky nipples and nip at his ear. He moans, low and needy and starts to complain about you teasing him again before you pull almost all the way out and slam into him again suddenly {if small or medium dick: with a wet slap of skin against skin as your [hips] meet his, jiggling his rounded ass enticingly./if big or HUGE dick:, causing him to yelp as the head of your [biggest dick] slams into his cervix.} {if cunttail: Feeling a little left out, your [tailcunt] stirs, swishing back and forth behind you before slipping around your waist to get a piece of the action. With a practiced, almost graceful movement, it slides its moist folds over Alex’s hip before rearing back and engulfing his cock in one smooth motion. Alex gasps, knees almost giving out from under him at the dual sensation of fucking and being fucked, but you manage to hold him up by his waist.}

After this, you settle into a quick but steady rhythm, pulling him out and leaving him empty before filling him up again {if multicock:, your extra dick(s) rubbing against his pussy-slicked balls and thighs./if herm:, your own neglected (pussy/pussies) throbbing with sympathetic need {high wetness: and soaking your (thighs/tail/slick, gooey membrane)./if both: your extra dick(s) rubbing against his pussy-slicked balls and thighs while your own neglected cunt throbs with sympathetic need {high wetness:, soaking your (thighs as well/tail as well/slick, gooey membrane as well).} He’s probably not the best fuck in the galaxy but he has to be up there with the way he slams back into you in time to your thrusts and clenches around you {if small dick: despite your size}, almost like he’s milking your cock. You just about think you’re going to cum first until you hear him cry out, shuddering as his dick {no tailcunt: spurts thick ropes of cum onto the sheets/tailcunt: feeds thick ropes of cum into your hungry pussy tail} and his walls spasm wildly around you, wetting your {thighs/front} {even further} as he collapses forward onto the mattress. Looks like he’s a squirter too, on top of everything else. You follow shortly after him, {low cum quantity: {if no knot: planting/if knot: knot bulging as you plant} your seed deep in his pussy/medium cum quantity: {if no knot: unleashing/if knot: knot swelling to full size as you unleash} gob after gob of thick [cum] inside of him {if no knot: until it starts to drip out around you}/high cum quantity: unleashing such a massive, powerful torrent of [cum] that his belly begins to round out, man-womb packed so full of your seed that he looks a few months pregnant {if no knot: even though most of it came rushing out around your cock/if knot: thanks to your knot plugging his pussy so well that only a few thin streams can escape}}.

“<i>Oh wow,</i>” he groans, rolling onto his back and panting, cum {dripping/streaming/gushing} from his snatch {if knot: as your knot slips out of him/high cum volume: as he runs a hand over the taut mound of his stomach/if knot and high cum volume: as your knot slips out of him. Tentatively, almost gingerly, he runs a hand over the taut mound of his stomach}. “<i>You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover, I’m gonna need it. Feel free to use the shower.</i>”

You get yourself cleaned up, retrieve your clothes, and head back to the bar.
[Catch Vaginal]
(Shoutout to all the cunthavers)
You smile down at Alex and {if biped: climb on top of him, straddling his hips to/if naga: slither onto the bed to/if goo: slither onto the bed and envelop his thighs to/if frontgentials taur or some kind of weirdass caterpillar: place your front feet on the bed and kneel to} position your womanly parts over his cock {if herm: while your own dick(s) stand(s) proudly at attention}. He seems to catch on quickly enough, placing his manicured hands at the crests of your hips, though more to keep you steady than to take a leading role himself, it seems. With an agonizing slowness, you lower yourself down onto him, the lips of your [cunt] rubbing teasingly over his cock {high wetness: while your fluids sheath him in slick wetness before you’ve even taken him}. You can actually see him straining not to buck his hips or try to force you down onto him and you revel in it, savoring each moment as much as you can before it becomes too much for you and you drop down onto him with a wet slapping sound. (VAGINAL VIRGINITY/HYMEN CHECK)
If tight:
Alex isn’t exactly big, or at least he isn’t one of the many behemoths you know are waiting out there, but he’s big enough to stretch you out. You can feel each and every vein and ridge on his cock and even the way it twitches slightly with his pulse as it fills you out deliciously {if herm:, your cock(s) twitching and leaking precum over his stomach in sympathetic lust} {if multipussy: and even the causing the walls of your unused (snatch/snatches) to rub against each other wonderfully}.
if medium:
Alex’s isn’t exactly the biggest dick you’ve taken in your adventures, but he’s big enough to make you feel wonderfully filled, pressing against your walls in all the right ways {if herm: as your (cock twitches and leaks/cocks twitch and leak pre) over his stomach in sympathetic lust} {if multipussy: and even the causing your unused (snatch/snatches) to feel full, (its/their) walls rubbing against each other}.
if gaped:
You’ve seen some big cocks in your adventures, and in all honesty Alex’s run of the mill, unenhanced human penis doesn’t really measure up, but that doesn’t stop you from trying. Rolling your hips, you try to find a position where at least the head of his cock rubs against you and Alex, sensing your frustration and probably working through a bit of his own, tries to match you. Eventually the two of you settle on having you lie almost on top of him, supporting yourself on your elbows {if breasts > B cup: your [breasts] sandwiched between your chests {if milk: and leaking your [milk] all over him}./if herm: your dick(s) sandwiched between you and getting pre everywhere./if breasts and herm: your breasts and dick(s) sandwiched between the two of you, coating his chest in {if milk: your fluids/if not: your precum}}{if multipussy:, though your unused snatches still feel disappointingly empty}.
{if tailcock: Your [tailcock], seemingly feeling a bit left out, makes itself known, lashing about behind you before diving {if biped: under your [ass]/if naga: around your snakelike form/if goo: around your amorphous lower half/if taur: under your quadrupedal belly} to plunge into Alex’s waiting cunt, causing him to buck in surprise and drive his cock deeper into you in turn.}

Moaning, you brace yourself and begin to bounce up and down on your lover’s cock, {wetness low or medium: feeling it in exquisite detail as it passes through your walls and netherlips/wetness high: enjoying the wet squish-squish-squish each movement brings}. {if breasts: Your tits {if A-B cup: jiggle with a slight, but satisfying weight/if C-DD cup: bounce wildly and slap against your chest with a satisfying heft/if DDD+ cup: threaten to smack you in the face} {if breasts and herm: and your} {if just herm: Your cock(s) slap against his stomach wetly} as you move faster and faster, moaning ecstatically as Alex thrusts up each time to meet you on the way down.} {if none of those: You move faster and faster, enjoying the ride and moaning ecstatically as Alex thrusts up each time to meet you on the way down.}

You’re close, you’re very close {if tight: and you’re sure you’re going to come first. Doubly so when Alex reaches down and/if medium or gaped: but you’re a little disappointed to note that it seems like Alex is going to come first, at least until he reaches down and}  {if herm: starts to jack off {one of} your cocks/if not: starts to play with your [clit]}. Slamming your hips down onto his one last time, you come, hard {if herm: your [cocks]/if dicktail: your tail-cock symbiote/if herm and dicktail: your [cocks] and tail-cock symbiote} following shortly after,} {(If cocks) low cum quantity: spattering his chest with [cum]/medium cum quantity: painting his chest with your [cum]/high cum quantity: thoroughly coating him in your copious [cum]}. The orgasmic rippling of your [cunt] {if dicktail: combined with the sensation of hot cum filling his cunt} is enough to send him over the edge, moaning and arching his back as his seed spurts up inside of you, painting your insides white.

“<i>Oh wow,</i>” he groans, panting as you roll off of him. “<i>You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover, I’m gonna need it. Feel free to use the shower.</i>”

You get yourself cleaned up, retrieve your clothes, and head back to the bar.
[Frottage]
(Dickhavers again (Fun variant for herms if I get to it))
Smiling {wolfishly/sweetly}, you {if not taur/’pillar: sit down on the bed and gesture for Alex to sit in your lap./if taur/’pillar: gesture for Alex to kneel on the bed so his crotch is level with yours.} He’s quick to comply, getting into position {straddling you/on the bed} and bracing himself against you, leaning in to press his firm, toned chest against your{s/ [breasts]}, your
If one cock:
	If small:
cocks pressed together between your {{pregnant bulk/soft, rounded belly} and his flat stomach/flat stomachs}. His member, while pretty respectable by pre-enhancement standards, is definitely on the smaller end of the scale, but even so it {dwarfs/is noticeably bigger than} yours, looming over it and pressing it back against your [skin].

“<i>It’s so cute,</i>” Alex coos, arms still draped around your shoulders. “<i>I almost wanna put a little hat on it or something.</i>”

You {smile/laugh/give him a stern look} and get back to business, placing your hands on his waist to steady him.
If medium:
cocks pressed together between your {{pregnant bulk/soft, rounded belly} and his flat stomach/flat stomachs}, your [head] rubbing against his smooth skin {high cum volume: and drooling precum all over him}. Alex, seemingly a fan of moderation, has a smaller dick than yours{, though not by much,} and leans back briefly to give your [cock] one last appreciative once-over before draping his arms over your shoulders while you place your hands on his waist to steady him.
		If big:
[cock] dwarfing his and forcing {not taur/’pillar: him to sit back on your knees/taur/’pillar: you to stand back away from the bed} with its monstrous girth. You almost can’t feel Alex’s cock against yours at all, but his smooth chest {if tits > C cup: on the underside of your member combined with the warm embrace of your own [breasts] around the rest/if not: rubbing against the underside of your member} is definitely enough to compensate. Murmuring happily, he leans in and kisses the {head/or if you’re really long: shaft} of your cock{if high cum volume:, smearing your precum over his full lips} as you reach around to place your hands on his waist.
	If multicock:
		2 dicks:
dual dicks coming to rest on either side of Alex’s, forming a tight V-shape that he seems to be having some trouble resisting the urge to fuck.

“<i>Oh man,</i>” he moans, rocking his hips against yours, his pre-slicked cock sliding back and forth across the sensitive bundle of nerves at the meeting of your [cocks]. “<i>You’re really making me reconsider saving up for some more exotic splices {man/babe}. This is too much.</i>”

He fidgets a little while longer before managing to calm down, taking your hands and moving them to his hips as if to ask you to help him keep steady.
		3+ dicks:
[cocks] nestling around his like a phallic bouquet, surrounding his hard, throbbing cock in a cluster of rigid man-meat. Alex moans loudly, bucking his hips against yours as he’s seemingly overwhelmed by the sensation of being surrounded by your multitude of dicks.

“<i>Oh man,</i>” he moans, rocking his hips against yours, his pre-slicked cock lost in your forest of manhood, being rubbed against on all sides {high cum volume: and coated in your [cumvisc] pre}. “<i>You’re really making me reconsider saving up for some more exotic splices {man/babe}. This is too much.</i>”

He fidgets a little while longer, getting his cock properly acquainted with your [cocks] while you place your hands on his hips to steady him.

{if hard: “<i>Get ready,” you tell him, tightening your grip./if not: “<i>Ready?</i>” you ask, {if nice: kissing him on the nose/if mischievous: flashing him a winning smile}}. Alex nods, almost bouncing {taur/’pillar: on the bed/if not: in your lap} in anticipation. Assured that he’s worked up enough for your liking, you begin to move your hips. You start off slow, at first, letting {high/medium cum volume: your {copious} precum/low cum volume: Alex’s precum}{if lactating: and the [milk] steadily leaking down your chest from your [nipples]} coat the two of you thoroughly for smoother and smoother strokes. Seemingly overwhelmed by the sensation of {small cock: your [head] gliding across his cock/medium: your [cock] rubbing against his/big: his little boy-clit rubbing against your titanic tool/multicock: being surrounded by your hard, ready cocks}, your androgynous lover moans and presses himself against you, {huge cock: leaning around your [biggest cock] to hide his face against your shoulder, effectively jerking you off with the crook of his elbow in the process/if not: hiding his face against your [breasts] {if breasts > B cup: and murmuring his approval into your cleavage}}.

“<i>M-more,</i>” he gasps, breath hot against your [skin]. “<i>Harder, please.</i>”

You’re only happy to oblige. Sliding your hands down his back to grasp his full, round ass - one part for leverage and two parts for your own pleasure - you begin to pick up the pace. The wet sound of skin against cum-slick skin fills the air as you thrust against him, {tentacle/prehensile dick: your wet cock(/s) twining around his/small/med/big dick: the wonderful friction of your cocks driving you to greater speeds/multicock: his cock almost lost among your [cocks]/huge dick: essentially using {if breasts > C cup: your [breasts] and his chest and arms/if not: both of your torsos and arms} as a person-sized onahole for your mighty manhood}{balls and taur/’pillar: as your [balls] swing heavily below you {huge balls:, slapping against the side of the bed} with each trust/if herm: as your neglected [cunt/s] contract(s) rhythmically {high wetness and taur/’pillar:, drooling down your thighs/high wetness and not:, soaking the sheets}/if herm with balls and taur: as your [balls] swing heavily below you and your neglected [cunt/s] contract(s) rhythmically}. You’re just nearing the edge yourself when Alex starts to shudder and scrabble at your back.

“<i>Shit, [name], I’m coming.</i>” One final buck of his hips sends him over, painting {huge cock: his chest and the underside of your [cock]/if not: both of your chests with sticky white strands}. His cunt clenches in sympathetic orgasm, wetting {taur/’pillar: his girlish thighs and the sheets below him/if not: your thighs} with femcum as he writhes and pants, trying to catch his breath.

{if hard: You point out that you haven’t cum yet, before he has a chance to get too relaxed.}

“<i>Sorry,</i>” he says, sounding more than a bit winded. “<i>Couldn’t hold off any longer. Here, let me make it up to you.” {taur/’pillar: Sliding off the bed, he kneels in front of you/if not: Sliding back off your lap, he leans forward} and takes your still-hard [biggest cock] in {big or huge: both of} his hand(s) and starts to jerk you off. It’s obvious that he’s pretty tired, but he gets to the task with enthusiasm,
If small cock:
taking your whole member into his mouth in one smooth movement {multicock: as he tends to {the other/the rest} with his hands {3+ cocks:, dividing his attentions between your spares as equally as he can manage}. He hums around it contentedly, tongue skillfully tickling the underside {herm: while he {3+cocks: takes a break from handjobs to slide/< 3 cocks: slides} a hand up the inside of your thigh and rubs his fingers across the folds of your femsex/balls: while he {3+cocks: takes a break from handjobs to cup/< 3 cocks: cups} and toy(s) with your [balls]/herm with balls: while he {2+cocks: takes a break from handjobs to cup/1 cock: cups} your [balls] with one hand and toys with the folds of your [cunt(s)] with the other}.
	If medium cock:
taking a deep breath before taking your whole member into his mouth in one smooth movement, flinching a little as your [head] bumps against the back of his throat but managing it nonetheless. After a pause to get himself situated he starts to bob his head, swallowing and swirling his tongue to stimulate your whole length {if multicock: as he tends to {your other/the rest of your} cock(s) with his hands {3+ cocks:, dividing his attentions between them as equally as he can manage}/if herm: as he slides a hand up the inside of your thigh and rubs his fingers over the lips of your [cunt(s)], teasing your [clit(s)]/if multicock herm: as he divides his attention between your spare cock(s) and your needy [cunt(s)], deft hands playing over them like a skilled musician plays his instrument}.
	If big cock:
wrapping both of his hands around your shaft and taking your [head] into his mouth. It takes him a second to work out how to best pleasure your [biggest cock] {herm or multicock: along with the rest of you} with the limited tools available to him, but he manages, {pure male, 1 cock: fingers tracing over veins and ridges, touching delicate and feather-light one moment and squeezing rhythmically the next while his skillful tongue swirls over your head./pure male, multicock: hands darting between your members as he kisses and sucks at the length of each in turn, multitasking skillfully and letting no cock go neglected for too long./herm: sparing a hand to toy with your [clit(s)] {multicock: while the other tends to your spare rod(s)}. His fingers dance over your slick folds {multicock: and hard cock(s)}, teasing and toying while he swirls his tongue and hums around you.}
	If huge cock:
wrapping both of his hands around your shaft and trailing slow, sucking kisses along the underside of your [biggest cock] and trailing his tongue in torturously slow circles over your [head]. One man pleasuring your impressive length and girth with just his mouth and hands is something of a feat {herm or multicock: by itself}, but he manages {herm or multicock:, even sparing a moment for your {spares/poor, neglected [cunt(s)]/spares and your poor, neglected [cunt(s)]}. His lips and hands are wonderfully soft as he works you over, {one cock, not herm: delivering immense pleasure despite not even being enough to fully wrap around your titanic tool/multicock: darting from cock to cock, tracing over veins and pressing insistently at sensitive spots to try to distribute the pleasure evenly/herm: fingers rubbing insistently at your [clit(s)] and over your netherlips as he continues to lavish your cock with affection/multicock herm: darting from cock to cock and rubbing insistently at your [clit(s)], making sure no part of you goes neglected for too long}
	
A few long moments of intensive care under Alex’s near-worshipful mouth and hands are enough to send you over. Finally, you cum, {low cum volume: spattering his face with streaks of [cumcolor]/med cum volume: painting his face a lovely shade of [cumcolor] and drenching him thoroughly/high cum volume: blasting him with such a torrent of [cum] that he reels backwards}{herm: while your pussy(/pussies) bear down on his fingers {high wetness: and gush femcum}}.

 “<i>Oh wow,</i>” Alex groans, {med or high cum volume: wiping [cum] out of his eyes and} collapsing back {taur/’pillar: against the side of/not: onto} the bed now that his duty is done. “<i>You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover, I’m gonna need it. Feel free to use the shower.</i>”

You get yourself cleaned up, retrieve your clothes, and head back to the bar.

[Catch Anal]
(Fun for everyone)
{if biped, naga, goo, tripod: You roll over, off of Alex and onto your stomach again, wriggling your hips seductively as you reach back to pull the cheeks of your [ass] apart and put your [asshole] on full display./if taur or some kind of caterpillar thing: You straighten up, leaving Alex lying on the bed, then pull a graceful about-face, turning so your [ass] faces him, and glance over your shoulder as you sway your [hips] seductively.}
If PC has vagina:
Alex seems a little confused by the gesture, but he {if biped/naga/goo/tripod: stands up and grabs your waist, getting himself into position./if taur/caterpillar: sits up and gets himself into a kneeling position on the bed to get a better angle.}

“<i>Are you sure?</i>” he asks. “<i>I’ve always thought assplay was, I don’t know, less fun. There’s a reason I saved up for years to get myself a pussy of my own. {if gaping ass: Looks like you’d know better than me from the looks of things, though}.</i>” You reassure him that you can absolutely have as much fun with your ass as you can with your cunt, if not more.
If PC male or unsexed:
Alex grins, {if biped/naga/goo/tripod: standing up and grabbing waist to get himself into position./if taur/caterpillar: sitting up and getting himself into a kneeling position on the bed to get a better angle.}

“<i>Well, alright then,</i>” he says, reaching down between his legs to gather up a handful of the slick moisture already drenching his thighs at your lewd display. With a practiced hand, he spreads his self-made lubrication over his cock, giving it a few quick strokes before {If PC is a flatass: placing his hands on your hips again/if PC has a real ass: spreading your cheeks apart} and lining himself up with your entrance.
if tight asshole:
You brace yourself, willing yourself to relax and accept the penetration. Alex’s copious juices ease the process a bit, but thanks to how tight you are it’s still slow and just on the right side of painful. After what feels like an eternity of being stretched around him he finally hilts himself, his balls coming to rest gently against your {if female or herm: [cunts]/if male: taint/if unsexed: featureless crotch}.
if medium asshole:
You relax, readying yourself for the coming fuck, and thanks to Alex’s copious juices he’s able to slide in with one swift motion, hilting himself inside of you with his balls slapping against your {if female or herm: [cunts]/if male: taint/if unsexed: featureless crotch}.
if gaped asshole:
You’re more than ready to be filled and let Alex know, slamming your [butt] back against his hips as soon as he gets his head in, your {if female or herm: [cunts]/if male: taint/if unsexed: featureless crotch} slapping against his balls. He yelps, doubling over slightly for a moment before recovering.
(ANAL VIRGINITY CHECK)

“<i>Shit,</i>” he hisses through gritted teeth, clinging to your [hips] as if for dear life. “<i>You’re so {tight/medium ass: hot and tight/gaped ass: hot.}</i>” You look back over your shoulder at him and ask if he’s just going to stand there or if he’s going to fuck you. Grunting, he buckles down and gets to moving his hips, slowly at first, but gradually picking up speed at your encouragement. Leaning back into his every thrust, you moan encouragements to him, urging him faster and faster until his hips meet yours again and again at a feverish pace.
If biped/naga/goo/tripod and breasts > B cup:
Your breasts {B-C cup: bounce freely/D-DDD cup: sway pendulously/DDD-HHH cup: swing back and forth heavily/I+ cup: rest on the mattress} beneath you, {if lactating: making the sheets wet and sticky with your [milk]/if not: adding greatly to the wild ride}{I+ cup: as your [nipples] rub against the bedspread}.
{if tailcock: As if roused from its slumber by all this vigorous activity, your [tail] rises to attention, swishing back and forth briefly before snaking around Alex’s hip and plunging deep into his neglected cunt, which only serves to spur him on to greater speeds as he shudders and moans.}

{if female: Your juices coat his balls and your thighs {if high wetness: dripping onto the {biped/naga/goo/tripod: sheets/taur/caterpillar: floor} with every thrust and you gasp, hardly able to stand it all./if male: Your cock (drips/streams) pre onto the {biped/naga/goo/tripod: sheets/taur/caterpillar: floor} with every thrust, the pressure on your prostate almost too much to bear./if herm: Your mixed sexual juices drip onto the {biped/naga/goo/tripod: sheets/taur/caterpillar: floor} with every thrust as you’re overwhelmed by the dual sensations of Alex’s balls slapping against your [cunts] and his cock rubbing against your prostate over and over again./if unsexed: Your [asshole] clenches and unclenches with every thrust, the sensations coming from your sensitive ring being {if tight: stretched so much/if medium/gaped: fucked so well} almost too much to bear.} Alex seems to feel the same, his moans growing breathier and his thrusts more uneven as his manicured fingernails dig into your [skin] slightly. Before you know it he’s cumming, thrusting into you with one final, loud slap of skin against skin and emptying his balls into your waiting ass {if tailcock:, his cunt drooling and clenching around your [tailcock]/if not:, his neglected cunt drenching his thighs). The sensation of all that thick, hot hermspunk painting your insides white is enough to send you over, {if female: your own [cunts] spasming wildly {high wetness: and adding to the growing pool of pussy juices accumulating around {biped/naga/goo/tripod: your knees/taur/caterpillar: Alex’s knees} on the bed./if male: your own [cocks] gushing your [cumTemp], [cumVisc] [cum] all over the {biped/naga/goo/tripod: sheets/taur/caterpillar: floor} {high cum volume: and puddling around your {biped/naga/goo/tripod: knees/taur/caterpillar: feet}./if herm: your own [cunts] spasming wildly {high wetness: and adding to the growing pool of pussy juices accumulating around {biped/naga/goo/tripod: your knees/taur/caterpillar: Alex’s knees} while your [cocks] gush [cum] all over the {biped/naga/goo/tripod: sheets/taur/caterpillar: floor} {high cum volume:, puddling around your {biped/naga/goo/tripod: knees/taur/caterpillar: feet}./if unsexed: your ass squeezing Alex’s cock like a vice, trying to milk him for every last drop of cum he can give before finally relaxing}.

“<i>Oh wow,</i>” he groans, panting as he {biped/naga/goo/tripod: collapses onto the bed beside you/taur/caterpillar: collapses back onto the bed}{if tailcock:, your [tailcock] finally slipping out of him}. “<i>You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover, I’m gonna need it. Feel free to use the shower.</i>”

You get yourself cleaned up, retrieve your clothes, and head back to the bar.
[Bail Once More]
Now that you’re actually here, you’re not so sure you want this anymore. You tell Alex that before he gets his hopes up too high.

“<i>Shit, really?</i>” he asks, looking a little insulted. “<i>Well, I’m not going to force you or anything but man, what a letdown. I’ll see you later, I guess.</i>”

You {shrug dismissively/apologize/if sillymode: apologize for your deathly allergy to fun}, get dressed, and head back to the bar.