/// @description  Variables

// Inherit oParEntity variables
event_inherited();

facing = 1;

//Changes
/*
 * 0 - Normal
 * 1 - Fire
 * 2 - Water - Will probably turn to ice
 * 3 - Lightening
 * 4 - Bomb???? 
 */
powerup = 1
generateBoundry = y + 540
hp = 10
canBeHit = true
hitByLast = noone
// Movement ///////////////////////////////////////////////////////////////////

groundAccel = 0.6;
groundFric  = 4.00;
airAccel    = 0.75;
airFric     = 0.01;
vxMax       = 2.75;
vyMax       = 5.0;
jumpHeight  = 6.00;
gravNorm    = 0.25;
gravSlide   = 0.5; 

clingTime   = 2.0;

/* BACKUP

groundAccel = 1.00;
groundFric  = 2.00;
airAccel    = 0.75;
airFric     = 0.01;
vxMax       = 5.50;
vyMax       = 10.0;
jumpHeight  = 6.00;
gravNorm    = 0.50;
gravSlide   = 0.25; 

clingTime   = 2.0;
*/

// Misc ///////////////////////////////////////////////////////////////////////

// States
IDLE     = 10;
RUN      = 11;
JUMP     = 12;
ROLL     = 13;

// Initialize properties
state  = IDLE;
facing = image_xscale; // Change xscale in editor to adjust initial facing

// For squash + stretch
xscale = 1;
yscale = 1;

///////////////////////////////////////////////////////////////////////////////

attacking = false;
blocking  = false;

//fallTime = 0;
//fallMax  = 28;

