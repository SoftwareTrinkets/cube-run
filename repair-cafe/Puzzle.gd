extends Node2D
export var pieces = [];
export var Text: NodePath;
var solved_pieces = 0
var selectedPiece;
var hoveringPiece;

# Called when the node enters the scene tree for the first time.
# func _ready():

func _input(event):
	if event is InputEventMouseMotion:
		if selectedPiece != null: #&& !get_node(pieces[selectedPiece]).connected:
			get_node(pieces[selectedPiece]).position += (event.relative * 2);

func _on_Area2D_mouse_entered(extra_arg_0):
	#if !get_node(pieces[extra_arg_0]).connected:
		hoveringPiece=extra_arg_0

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			selectedPiece=hoveringPiece
		if !event.pressed:
			if selectedPiece != null:
				get_node(pieces[selectedPiece]).pieceReleased();
				selectedPiece=null

func _on_Area2D_mouse_exited():
	if hoveringPiece == selectedPiece:
		selectedPiece = null # Replace with function body.
		
func add_solved_piece():
	solved_pieces = solved_pieces + 1;
	print("add solved piece " + str(solved_pieces) )
	if(solved_pieces == pieces.size()):
		print("SOLVED!")
		get_node(Text).change_speech_text("Puzzle solved!");
	
func remove_solved_piece():
	solved_pieces = solved_pieces -1;
	print("remove solved piece " + str(solved_pieces) )
