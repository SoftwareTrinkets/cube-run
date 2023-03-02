extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var file_data = {  
}

# Called when the node enters the scene tree for the first time.
func _ready():
	loadjson()
	#if file_data.has("passages"):
	#	 print(file_data.passages[0].text)

func change_speech_text(newText: String):
	self.text = newText
# Called every frame. 'delta' is the elapsed time since the previous frame.


func savejson():
	var file = File.new()
	file.open("res://file_data.json", File.WRITE)
	file.store_line(to_json(file_data))
	file.close()

func loadjson():
	var file = File.new()
	if not file.file_exists("res://file_data.json"):
		print("File does not exist")
		savejson()
		return
	file.open("res://file_data.json", File.READ)
	var data = parse_json(file.get_as_text())
	print(data.passages[0].cleanText)
	file_data = data

