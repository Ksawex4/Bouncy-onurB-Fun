extends Node

var Collision = true
@warning_ignore("unused_signal")
signal UpdateCollision()

var Bouncy_onurB = {
	"MinSpeed": 1.0,
	"MaxSpeed": 300.0,
	"MinJumpHeight": 20.0,
	"MaxJumpHeight": 300.0,
	"MinGravity": 0.1,
	"MaxGravity": 25.0,
	"MinR": 0.0,
	"MaxR": 1.0,
	"MinG": 0.0,
	"MaxG": 1.0,
	"MinB": 0.0,
	"MaxB": 1.0,
	"MinA": 0.3,
	"MaxA": 1.0,
	"MinMaxJumps": 1,
	"MaxMaxJumps": 100,
	}
