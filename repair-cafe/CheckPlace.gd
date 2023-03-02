extends Area2D

export var ConnectID: int;
var HasPiece = -1;

func _on_Place0_area_entered(area):
	var otherNode = area.get_node("../");
	if "ConnectID" in otherNode && HasPiece == -1:
		#otherNode.set_position(self.position)
		otherNode.ReleasePlace = self.position;
		HasPiece = otherNode.ConnectID
		otherNode.set_connected(ConnectID == otherNode.ConnectID)
			
			

func _on_Place_area_exited(area):
	var otherNode = area.get_node("../");
	if "ConnectID" in otherNode: 
		#if otherNode.ConnectID == ConnectID:
		print(ConnectID, otherNode.ConnectID)
		otherNode.unset_connected(ConnectID == otherNode.ConnectID)
		HasPiece = -1
		
