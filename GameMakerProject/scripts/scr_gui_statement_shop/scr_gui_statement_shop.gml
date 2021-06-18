/*
	Insert description here
	return:
*/
function OpenGUIStatementShop() {
	var shopControls = GetDbGUIButtonGroupByIndex(GUIButtonGroupIndex.ShopControls);
	AddGUIButtonGroupActive(shopControls);
	
	var shopItemList = GetDbGUIButtonGroupByIndex(GUIButtonGroupIndex.ShopItemList);
	AddGUIButtonGroupActive(shopItemList);
	
	with (obj_controller_gui) {
		itemListPageIndex = 0;
		itemListRefresh = true;
	}
}

/*
	Insert description here
	return:
*/
function CloseGUIStatementShop() {
	RemoveGUIButtonGroupActiveByIndex(GUIButtonGroupIndex.ShopControls);
	RemoveGUIButtonGroupActiveByIndex(GUIButtonGroupIndex.ShopItemList);
}