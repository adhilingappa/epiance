package core;

import mmarquee.automation.ControlType;

public class Controls {

	/**
	 * This method will return control type requested
	 * 
	 * @param controlType
	 * @return
	 */
	public static ControlType getControl(String controlType) {
		switch (controlType.toUpperCase()) {

		case "BUTTON":
			return ControlType.Button;

		case "NONE":
			return ControlType.None;

		case "CALENDER":
			return ControlType.Calendar;

		case "CHECKBOX":
			return ControlType.CheckBox;

		case "COMBOBOX":
			return ControlType.ComboBox;

		case "EDIT":
			return ControlType.Edit;

		case "HYPERLINK":
			return ControlType.Hyperlink;

		case "IMAGE":
			return ControlType.Image;

		case "LISTITEM":
			return ControlType.ListItem;

		case "LIST":
			return ControlType.List;

		case "MENU":
			return ControlType.Menu;

		case "MENUBAR":
			return ControlType.MenuBar;

		case "MENUITEM":
			return ControlType.MenuItem;

		case "PROGRESSBAR":
			return ControlType.ProgressBar;

		case "RADIOBUTTON":
			return ControlType.RadioButton;

		case "SCROLLBAR":
			return ControlType.ScrollBar;

		case "SLIDER":
			return ControlType.Slider;

		case "SPINNER":
			return ControlType.Spinner;

		case "STATUSBAR":
			return ControlType.StatusBar;

		case "TAB":
			return ControlType.Tab;

		case "TABITEM":
			return ControlType.TabItem;

		case "TEXT":
			return ControlType.Text;

		case "TOOLBAR":
			return ControlType.ToolBar;

		case "TOOLTIP":
			return ControlType.ToolTip;

		case "TREE":
			return ControlType.Tree;

		case "TREEITEM":
			return ControlType.TreeItem;

		case "CUSTOM":
			return ControlType.Custom;

		case "GROUP":
			return ControlType.Group;

		case "THUMB":
			return ControlType.Thumb;

		case "DATAGRID":
			return ControlType.DataGrid;

		case "DATAITEM":
			return ControlType.DataItem;

		case "DOCUMENT":
			return ControlType.Document;

		case "SPLITBUTTON":
			return ControlType.SplitButton;

		case "WINDOW":
			return ControlType.Window;

		case "PANE":
			return ControlType.Pane;

		case "HEADER":
			return ControlType.Header;

		case "HEADERITEM":
			return ControlType.HeaderItem;

		case "TABLE":
			return ControlType.Table;

		case "TITLEBAR":
			return ControlType.TitleBar;

		case "SEPARATOR":
			return ControlType.Separator;

		case "SEMANTICZOOM":
			return ControlType.SemanticZoom;

		case "APPBAR":
			return ControlType.AppBar;

		default:
			System.out.println("Unsupported Control Type :- " + controlType);
			break;
		}
		return null;
	}
}
