/// @description Initialize Borders
// You can write your code in this editor

//WOOOOH Magic numbers
//The amount of space between the player and when the boundaries start generating automagically
for(i=0;i<800;i+=16){
	instance_create_layer(72,i,"Instances_1",oBlockBoundary)
	instance_create_layer(552,i,"Instances_1",oBlockBoundary)
}
