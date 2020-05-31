# DexcomLogger

For my project, I'm trying to create an app that will keep track of one's blood sugar response to different meals to make dosing easier in the future. A user will be able to add a meal, an estimated carb count for that meal, and the amount of insulin they took. This information will be added to a database along with blood sugar values at the time of the meal, thirty minutes after, and two hours after. The info from this database will be displayed as items under the search bar.

To get blood sugar values, the user first must be authenticated by the manufacturer of the continuous glocose monitor which is an implant that tracks blood sugar levels. In this case, I am using Dexcom (https://developer.dexcom.com/authentication). Once authenticated, the user should receive an authorization code that can be exchanged for an access token and a refresh token. After receiving an access token and a refresh token, the client should be able to make API requests. I am stuck on step 3, which is receiving the authorization code. Originally, I had the Dexcom Authentication page as a WKWebView in DexcomSiteViewController.swift that was accessed by the "Sign In!" button (this file is also a mess). However, this resulted in the page never redirecting once the user clicked "Authorize." I added the "Authenticate" button to see if going about accessing the authentication page from SignInViewController.swift would be more effective. It now redirects back to my app, so the authenticate button seems to work better, but it doesn't receive an authorization code and displays "source application = Unknown" in the console.
