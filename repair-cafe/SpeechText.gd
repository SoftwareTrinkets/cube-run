extends RichTextLabel

var loadedTextArray = {}
var passages = []
var currentID = 1;

func _ready():
	loadjson()

func savejson():
	var file = FileAccess.open("res://file_data.json",FileAccess.WRITE)
	file.store_line(JSON.new().stringify(loadedTextArray))
	file.close()

func loadjson():
	var file = FileAccess.open("res://file_data.json",FileAccess.READ)
	if not file.file_exists("res://file_data.json"):
		print("File does not exist")
		savejson()
		return

	var test_json_conv = JSON.new()
	test_json_conv.parse(file.get_as_text())
	var data = test_json_conv.get_data()
	loadedTextArray = data
	passages.resize(data.passages.size())
	for passage in data.passages:
		var passageID = int(passage.id);
		var passageText = passage.cleanText;
		if passage.links.size() > 0:
			for link in passage.links:
				var ID = findIDfromName(link.passageName);
				passageText += "\n > [url=" + str(ID) + "]" + link.passageName + "[/url]";
		passages.insert(passageID, passageText);

func findIDfromName(name: String):
	for passage in loadedTextArray.passages:
		if passage.name == name:
			return int(passage.id)
	
func _process(delta):
	if Input.is_action_just_pressed("next_line"):
		self.text =  passages[currentID];

func _on_meta_clicked(meta):
	currentID = int(meta)
	self.text =  passages[currentID];
