
//make an array for hot destination examples

const hotDestinations = ["Bali, Indonesia", "Maldives", "Santorini, Greece", "Maui, Hawaii", "Phuket, Thailand", "Dubai, UAE", "Barcelona, Spain", "Sydney, Australia", "Cape Town, South Africa"];
const coldDestinations = ["Reykjavik, Iceland", "Banff, Canada", "Svalbard, Norway", "Lapland, Finland", "Queenstown, New Zealand", "St. Petersburg, Russia", "Anchorage, Alaska", "Tromsø, Norway"];

// now to link the buttons on HTML using ids to help JS find the lines

const hotButton = document.getElementById("hot");
const coldButton = document.getElementById("cold");
const result = document.getElementById("result");
const pickButton = document.getElementById("pick");

//to store whether user has chosen hot holliday 
let isHot = true;
let currentDestination = 0;
let destinationList = "";


//use the onclick event to use the if statement when either button is clicked
hotButton.onclick = function() {
    console.log ("Hot button clicked");
    isHot = true;
    let destinationList = ""; //resets list 
    //loop through the hotDestinations array and add each destination to the destinationList variable to demonstrate loops
    for (let i = 0; i < hotDestinations.length; i++) {
        destinationList += hotDestinations[i] + "<br>";
    }
    result.innerHTML= destinationList;

  
}
coldButton.onclick = function() {
    isHot = false;
    let destinationList = "";
    console.log ("Cold button clicked");
    for (let i = 0; i < coldDestinations.length; i++) {
        destinationList += coldDestinations[i] + "<br>";
    }
    result.innerHTML= destinationList;
   };
   

//now to pick a destination using function
function pickDestination(){
    let destinations;
    if (isHot == true) {
        destinations = hotDestinations;
        result.style.backgroundColor = "orange";
    }
    else {
        destinations = coldDestinations;
        //to change CSS through
        result.style.backgroundColor = "lightblue";
    }
    result.innerHTML = destinations[currentDestination];
    currentDestination ++;
    
    if (currentDestination == destinations.length) {
        currentDestination = 0;
    }
}
pickButton.onclick = function() {
    pickDestination();
}
