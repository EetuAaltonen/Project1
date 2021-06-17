/*
	Insert description here
	param: _spriteName - Insert description here
	param: _oreSpriteName - Insert description here
	param: _dropCount - Insert description here
	param: _requiredToolName - Insert description here
	return:
*/
function OreVein(_spriteName, _oreSpriteName, _dropCount, _requiredToolName) constructor {
	SpriteName = _spriteName;
	OreSpriteName = _oreSpriteName;
	DropCount = _dropCount;
	RequiredToolName = _requiredToolName;
	
	/*
		Insert description here
	*/
	static Copy = function() {
		var copyOreVein = new OreVein(undefined, undefined, undefined, undefined);
		copyOreVein = CloneStructValues(self, copyOreVein);
		return copyOreVein;
    }
}