+++
title = "Going infinite on Boost bars"
subtitle = ""
tags = []
date = 2024-05-28
draft = false
description = "A look into how I was able to automate getting dozens of free Cadbury bars during a promotion"
banner = 'img/boost-bars/boost-collage.jpg'
+++

## A sweet treat

If you know me, you know I love a sweet treat after a main meal. I had just finished my lunch at work and that all too familiar need for a sweet treat visited. I head down to the nearby Woolworths Metro, and hunt through its labyrinthine aisles hunting for the right treat.

The choccies caught my eye. Cadbury were running a promotion where buying any specially marked bar gave you the chance to win a second free bar. Fond memories from my childhood of a similar Mars bar promotion filled my heart, and since Boost bars were less than half price, the deal was sealed and my sweet treat hunt concluded with a satisfying $0.90 AUD purchase.

![](img/boost-bars/cadburyComp.jpg "Cadbury win a bar a minute promo")

## Congratulations you are a winner

The free bar competition of 2023 was quite different to what I remember from 2003. What I remember is opening the Mars bar and on the inside of the wrapper it told you if you were a winner or not. Then you'd bring the wrapper to the school canteen, cautiously pathing away from the bully groups, and exchange the winning wrapper for another bar.

In 2023, you scanned a QR code, filled in a form with all of your personal information (including mandatory phone number), include "proof of purchase" (more on this later) and then got told if you win or not.

![The form looked something like this](img/boost-bars/cadburyForm.jpg "Cadbury competiton entry form")

I almost gave up there but like any good Aussie I can't resist a punt so decided to go for it, and…

![](img/boost-bars/cadburyWinner.jpg "Congratulations you are a winner")

I won! Free choccy time!!

…OH how I wish it were that simple.

![](img/boost-bars/winningText.jpg "Your code is CAD123456, redeem using the Vault app")

Cadbury had now texted a code to my phone. To get my free bar, I had to download an app? The "Vault Payments app"?? I have to give another company my phone number!? I thought Cadbury wouldn't have to give away a single bar because of all these hoops you need to jump through to even win.

I begrudgingly downloaded Vault Payments, entered my phone number and CAD code, which logged me into their system and gave me a _digital prepaid Visa card_.

![Here I go giving away my personal data again](img/boost-bars/vaultRedeem.jpg)

![Wait a minute, a $3 card?](img/boost-bars/vaultPaymentsAccountPage.jpg)

However, the value on the card the recommended retail price of the bar, in this case, $3.

So I didn't get a free bar, but by buying the bar on sale, I essentially spent 90¢ to get $3. $3 which I could use to buy three more Boost bars, which I could use to win more free bars…

I could go infinite on Boost bars!

![The science backs it up](img/boost-bars/fission.jpg)

## Going infinite is hard

By "going infinite" I mean _get a lot of Boost bars for free_. It was never going to be _actually_ infinite as the competition terms were clear that there were a fixed amount of winners per day.

If I even wanted to go a _little_ infinite on chocolate bars, a few major hurdles stood in the way:

- _One win per phone number per day:_ After reading the terms and conditions carefully (potentially a world first), I noticed you could only win once per day. Through some trial and error, I did indeed find that I would never win multiple times per day, but my first entry of the day won more than half the time\*; and that it was unique per phone number, not email or name.
- _It's time consuming:_ Filling out the entry form, getting the text message, putting the code from the text message into the Vault app, and redeeming the card, took minutes. If I wanted to do more than a handful per day, I would need to automate this for my mental health.
- _The ethics:_ Is it wrong for me to try and scale this out and take Cadbury for all they've got? Then I checked and saw Mondelez (owners of Cadbury) had [grossed over 11 billion dollars profit in 2022](https://ir.mondelezinternational.com/news-releases/news-release-details/mondelez-international-reports-q4-and-fy-2022-results#:~:text=FY%202022-,Gross%20Profit,11%2C312,-0.5) and figured they would be okay.

\*I don't know exactly wins were so common — my best guess is that not many people were entering the competition.

## "One" win per day

The one win per day was a real vibe killer for going infinite. I'd need more than one phone number.

I had heard of [Twilio](https://www.twilio.com/), a service which lets you rent phone numbers. These are "digital" phone numbers — you don't need to get a SIM card or a physical phone or anything — instead, you can configure Twilio to send a message to a server you own on the internet, which you can then process.

![](img/boost-bars/twilio.png "Twilio UI")

To do that of course you need a server on the internet that can run your code. This is where [Firebase](https://firebase.google.com/) comes in handy — it's quick and free to get something like that going.

So I signed up for Twilio, and set up Firebase, where I wrote some code that would text me on my physical phone if I won with my digital Twilio phone number. I still had to manually submit two entries per day (one per phone number), and manually redeem the texted codes in Vault, but hey, I could do two entries per day! Just a matter of getting a couple more phone numbers now!

![Criminal detected](img/boost-bars/policeman-blowing-whistle.jpg)

Twilio were one step ahead of me though. After your Twilio trial (_and after you pay them money_), if you try to register more than one phone number they lock your account until you prove you aren't using their services for anything nefarious. This makes sense as ~~naughty little chocolate goblins~~ spammers and scammers could abuse the platform.

![The Twilio police](img/boost-bars/twilioPolice.png)

I was presented with a form to fill in, asking about what kind of messages I'd be sending, what my website is, and so on. I figured they were mostly concerned about _outgoing spam_ based on the questions they were asking, so I gave it a crack and was fairly honest. I said I'd not be sending anything outbound, I just wanted use the service to "avoid providing my own personal phone number when filling in online forms" (100% true and honest and brave).

To my surprise they accepted this, but that back-and-forth took a while.

Oh, and I forgot to mention, the competition only lasted 2 months. By the time I got all this sorted, the competition was already half over.

## Automation

With Twilio unlocked I was able to buy three more phone numbers.

<div class="well">

### Why only three phone numbers and not 30?

- Firstly, I couldn't be 100% sure that this whole thing was going to work, so I didn't want to risk wasting $200. $20 was the minimum Twilio allowed me to spend, which got me buy 3 extra phone numbers for the month.
- Secondly, as fun as it would be to take Cadbury for all they got, I was more interested in getting everything hooked up and working for the sake of curiosity and learning, than actually making as much money as possible.

</div>

Now with four phone numbers (Twilio three phone numbers + my own real one) things were getting tedious, and I needed to automate entering the competition.

As I mentioned much earlier, entering the competition required all of my personal details as well as proof of purchase.

What is that proof of purchase exactly you might we wondering? A photo of the specially marked Boost bar, and its barcode number.

![A refresher of the full, tedious winning process](img/boost-bars/flowDiagram.jpg)

At a glance you might think a photo and barcode is a sound proof of purchase. But what if I told you the barcode numbers are the same on every Boost bar? In theory you could in fact take a photo of any old Boost bar, enter the one common barcode number, and proof complete. Maybe you could even just keep posting the _same_ photo of the _same_ Boost bar and they wouldn't care?

…Okay, using the same photo twice, it got rejected. But it took some time. I reckon there's some simple verification perhaps to check you aren't using an _identical_ image, that would be pretty easy to do. But multiple images of the same bar was getting through fine.

### The solution is 150 photos

I then proceeded to take ~150 photos (four phone numbers × 30 days left, plus some extra just in case) from different angles and a few different backgrounds of some bars, and put them into a queue on Firebase.

![So many bars!](img/boost-bars/boost-collage.jpg)
![The photo queue](img/boost-bars/queue.jpg)

I then wrote some code that each day would pull a photo from that queue and fill in the competition form using that photo as proof of purchase.

Next, instead of getting a text to my real phone if I won, I stored the winning codes (which, remember, then need to go into the Vault Payments app) in a database. So I now essentially had a big spreadsheet of winning codes that filled up bit by bit each day.

![The wins were rolling in](img/boost-bars/cadCodes.png)

## Redeeming

Now that I had all these CAD codes, the final step of automating it all was getting the code redeemed in the Vault app. Somehow this app is doing some magic to turn these CAD codes into Visa card numbers. In order to figure out how that worked, I needed to be able to see what the Vault app is sending and receiving over the internet. For a website, this is really easy using the [Network tab of Chrome developer tools](https://developer.chrome.com/docs/devtools/network), but you can't do that with an app.

### Proxyman

Using a tool called [Proxyman](https://proxyman.io/), along with [changing some settings on my phone](https://docs.proxyman.io/debug-devices/ios-device), I could make my phone send and receive its traffic _via my computer_ instead of directly to the internet.

Proxyman then allows me to look at what the phone was sending and receiving just like the Network tab in developer tools.

This all happens in real time, so as I navigated around and used the app, I could see what data my phone was sending and receiving for each part of the app. All I had to do was redeem a code, observe the data, and then programmatically do the same thing but with different code.

### What redeeming a code looks like

![Claiming a token was a very simple POST request](img/boost-bars/pman0.jpg)

It looks like to redeem a code, the app just sends a POST request to `https://eml.azure-api.net/v2/claim` with a JSON body containing `activationCode` (which comes from the text message), and then the `phoneNumber` it was sent to. Fantastically simple!

<div class="well">

**Technical sidenote:** This didn't work for long. After just one day of operation, I noticed my code spitting out errors during the redemption process. I opened the Vault app with Proxyman listening to see what was going on, and was immediately met with an updated app UI. Not a good sign — things had definitely changed! By complete coincidence, Vault had completely revamped their app — including how redeeming worked.

I tried to re-redeem the codes that errored earlier. They worked, but the data looked very different.

![Redeeming became a lot more complicated](img/boost-bars/pman1.jpg)

I was running out of time, and some brief Googling showed that they too were probably using Firebase and that [the new claim process involved a "physical device check"](<https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/sendVerificationCode#:~:text=app%20token%20validation.-,At%20least%20one%20of%20(iosReceipt%20and%20iosSecret)%2C%20recaptchaToken%2C%20or%20safetyNetToken%20must%20be%20specified%20to%20verify%20the%20verification%20code%20is%20being%20sent%20on%20behalf%20of%20a%20real%20app%20and%20not%20an%20emulator,-.%20This%20should%20come>) which made it much harder for me to do this programmatically. I decided to give up on redeeming, and just focused on collecting the codes for now.

</div>

### What browsing the Visa card numbers looks like

In the Vault app, once the code is redeemed, it takes you to your account page where it shows you all your Visa cards. It doesn't just show you the card number and CVV and all that immediately, no; this whole write up could be two sections shorter if it did.

After redeeming a card, this is what the request looks like for viewing your account page:

![](img/boost-bars/vaultPaymentsAccountPage.jpg "The Vault account page")
![Notice the censored ("XXXXX") card details](img/boost-bars/pmanCensoredCard.jpg)

From that you can tap on the card to view its details (number, CVV, all that good stuff). But the request and response for that looked like this in Proxyman:

![Red censoring is done by me, not the app](img/boost-bars/vaultPaymentsInspect.jpg "The Vault inspect card page")
![None of these look like Visa card numbers](img/boost-bars/pmanDip.jpg)

Where are the card numbers? Why can I see them on the app, but they seemingly aren't there in Proxyman?

## EML and DIP

I figured the information must be in there, just encrypted in some way. I happen to live with known hacker and custodian of [the mango zone](https://mango.pdf.zone/) "Alex" which is possibly the most convenient and most expert help possible for this exact particular situation.

Anyway, "eml" (in the request subdomain) and "dip" (in the request response) popped into google yielded the [EML Money In Motion™ payments API](https://developer.emerchants.com.au/). On that page is some [incredibly useful writing](https://developer.emerchants.com.au/dip/#decrypting-with-aes-256) on how DIP (Digital Interface Payload) works.

![How to decode a DIP](img/boost-bars/dipDiagram.png)

The details of this diagram aren't super important, but basically it tells us that you can un-scromble a DIP if you have:

- The 68 character string (we have that, "dip" in the response from before was 68 characters)
- The ephemeral key (we have that, `ephemeralKey` is sent as part of the request)
- The application key

That last one is interesting — we have a `keyId`, but not exactly the application key. According to the docs, [keyId is just an identifier](https://developer.emerchants.com.au/dip/#identifiers-and-keys) for a pre-shared, secret key. So the Vault payments app when they were setting up their EML Money In Motion™ payments API account must have said, "hey, for keyId `851ebb5d-3318-4472-b5ee-a055a38711b2`, the secret is _&lt;secretKey&gt;_.

The problem is, I don't know what `secretKey` is, so I can't unscromble the DIP. This is by design: if I was only eavesdropping the internet requests, and had no other information, I'd be cooked.

### But I have other information

The thing is, I was looking at the Visa card number, CVV, etc. on my phone. That means the app can unscromble the DIP, so it must have the secret key in there somewhere buried deep down in the confines of its mind.

So now I need to poke around the confines of its mind AKA look inside the app. Googling "download app file from app store" points us to [IPATool](https://github.com/majd/ipatool), which made it easy to download the app bundle. Luckily app bundles are just zips ([as per usual](https://stackoverflow.com/questions/62929717/why-do-many-file-formats-are-disguised-zip-files)), so from there I could unzip and poke around.

With all two of our braincells we came up with the idea of essentially "ctrl + f -> 'secret'" which instantly revealed the `secretKey` we were looking for:

![This is how you "ctrl + f -> 'secret'" recursively in files](img/boost-bars/grepSecret.jpg)

That pointed us to the `Info.plist` file which just had it sitting there:

![Ladies and gentlemen, we got him](img/boost-bars/appSecretInPlist.jpg)

**Note: they have since fixed this too.**

After writing some code that took all those pieces and followed the instructions from the DIP diagram earlier to unscramble to DIP, we tested out the key we found and it worked!

## What we have at this point

- A submission bot that is entering four entries per day pulling from the queue of 150 photos
- A growing database of winning codes
- No way to submit the codes 😥
- A way to decrypt Visa card numbers in the Vault account

## Wait so when do we get infinite chocolate

In the end, I manually redeemed all the winning codes in the Vault app. Their updated security worked! It just wasn't worth the effort to figure out or work around their new redemption process. Thankfully it only took about 20 seconds per code. I was thankful that I didn't end up buying 40 phone numbers!

After I redeemed them all, with Proxyman active I was able to "inspect" all of the Visa cards, getting their DIPs. They were then decrypted programmatically and stored in a spreadsheet.

![The end result (censored)](img/boost-bars/finalSheet.png)

And that's where I've left the project today. The next step would be trying to consolidate the ~80 $3 prepaid Visa cards into one account using a card processor like Stripe.

![A unrelated image displaying way more money than I made](img/boost-bars/money.jpg)

I wish that I had a video of me making a snow angel in Boost bars to wrap this up for you. But alas, all either of us are left with is the story of a guy who over-engineered the joy of a sweet treat.
