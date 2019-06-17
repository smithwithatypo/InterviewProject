function main(){   // for BACK option



var app = Application.currentApplication()
app.includeStandardAdditions = true
var se = Application('System Events')
var safari = Application('Safari')


// ---Array for opening Programming at iter()
var BasicArray = ['Github', 'StackOverflow', 'Kaggle'] 

// ---creates new dictionary (Key, Value)
var dict = new Map()

// ---Media category
dict.set('Youtube', 'https://www.youtube.com')
dict.set('Twitch', 'https://www.twitch.tv')
dict.set('Netflix', 'https://www.netflix.com')
// ---Programming category
dict.set('Github','https://github.com')
dict.set('StackOverflow', 'https://stackoverflow.com')
dict.set('Kaggle', 'https://www.kaggle.com')
// ---Social category
dict.set('Facebook', 'https://www.facebook.com')
dict.set('Reddit', 'https://www.reddit.com')
dict.set('Twitter','https://twitter.com')





// ---function opens up new tab, passes value x to URL bar
function url(x) {
safari.activate()
delay(0.2)
se.keyCode('17', {using: 'command down'})  // cmd t
se.keyCode('37', {using: 'command down'})  // cmd l
se.keyCode('0', {using: 'command down'})   // cmd a
se.keystroke(x)  // passes x through
delay(.2)
se.keyCode('36')  // enter
}


// ---iterate through BasicArray, get dict Value, and send to function url()
function iter() {
  var len = BasicArray.length
  var i
  for(i=0; i<len; i++) {
    ind = BasicArray[i]
	ret2 = dict.get(String(ind))
	url(ret2)
  }
}






// ---activates current app so arrow controls work
app.activate()


// ---holds user input for category
var category = app.chooseFromList(['Media', 'Programming', 'Social'], 
	{withPrompt: 'Choose a Category:'})
	
// ---holds user input from whichever case matches the input from above
switch(String(category)) {
  case 'Media':
    var choice = app.chooseFromList(['Youtube', 'Netflix', 'Twitch', '<--Back'], 
		{withPrompt: 'Choose a Tool:'});
	break;
  case 'Programming':
    var choice = app.chooseFromList(['All', 'Github', 'Kaggle', 'StackOverflow', '<--Back'], 
		{withPrompt: 'Choose a Tool:'});
	break;
  case 'Social': 
    var choice = app.chooseFromList(['Facebook', 'Reddit', 'Twitter', '<--Back'], 
		{withPrompt: 'Choose a Tool:'});
	break;
}




// ---switch to run iter(), or url(), or cancel
if(category==false) {
	console.log('cancel')
}	else if(choice==false){
		console.log('cancel')
}	else if(choice=='All') {
		iter();
}	else if(choice=='<--Back'){
		main();
}	else {
		var ret = dict.get(String(choice))   // holds Value related to user's Key input
		url(ret)   // sends Value to function url()
}
}  // wraps function main()



main()