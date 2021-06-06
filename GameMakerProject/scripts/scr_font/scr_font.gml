/*
	Insert description here
	param: _font - Insert description here
*/
function SetFontDraw(_font) {
	if (!is_undefined(_font)) {
		draw_set_font(_font.Style);
		draw_set_color(_font.Color);
		draw_set_halign(_font.HorizontalAlign);
		draw_set_valign(_font.VerticalAlign);
		draw_set_alpha(_font.Alpha);
	}
}