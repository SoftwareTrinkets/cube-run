extends Sprite
export var ConnectID: int
var puzzle;
export var connected = false;
export var ReleasePlace: Vector2;
# Called when the node enters the scene tree for the first time.
func _ready():
	puzzle = get_tree().current_scene.get_node("Puzzle")
	pass # Replace with function body.

func set_connected(correct: bool):
	connected = true;
	if correct:
		puzzle.add_solved_piece()
	

func unset_connected(correct: bool):
	connected = false;
	if correct:
		puzzle.remove_solved_piece()
	


func pieceReleased():
	print("Piece released!")
	if connected:
		position = ReleasePlace;
