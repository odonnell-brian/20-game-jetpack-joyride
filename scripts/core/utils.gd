class_name Utils

static func is_in_group(node: Node2D, groupName: String) -> bool:
	return node.is_in_group(groupName) or node.get_parent().is_in_group(groupName)
