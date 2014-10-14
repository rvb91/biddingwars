app = angular.module("biddingWars", []);


function HomeControl() {
	//Load the home page here
	// console.log("HomeControl is being loaded");
	vm = this;
	
	vm.removeFromStock = function (item, index) {
	    vm.items.splice(index, 1);
	  };
	
	vm.items = [{
    name: 'Scuba Diving Kit',
    id: 7297510
  },{
    name: 'Snorkel',
    id: 0278916
  },{
    name: 'Wet Suit',
    id: 2389017
  },{
    name: 'Beach Towel',
    id: 1000983
  }];
}
app.controller("HomeControl", HomeControl);

