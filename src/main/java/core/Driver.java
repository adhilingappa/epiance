package core;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.sikuli.script.FindFailed;

import mmarquee.automation.AutomationException;
import mmarquee.automation.ControlType;
import mmarquee.automation.Element;
import mmarquee.automation.UIAutomation;
import mmarquee.automation.controls.AutomationBase;
import mmarquee.automation.controls.ElementBuilder;
import mmarquee.automation.controls.Panel;
import mmarquee.automation.controls.Window;
import mmarquee.uiautomation.TreeScope;

public class Driver {

	private static final Logger log = LogManager.getLogger(Driver.class);
	public static UIAutomation automation;
	static int searchAttempts = 1;
	public static boolean rootSearch = true;
	public static Element searchContext;
	public static Element rootElement;
	public static int scope = TreeScope.SUBTREE;

	public Driver() {
		automation = UIAutomation.getInstance();
		rootElement = UIAutomation.getInstance().getDesktop().getElement();
		searchContext = rootElement;
	}

	/**
	 * This method will set search attempts for By class
	 * 
	 * @param searchAttempts
	 */
	public void setSearchAttempts(int searchAttempts) {
		Driver.searchAttempts = searchAttempts;
	}

	/**
	 * This method will set search to from root level or not
	 * 
	 * @param searchStatus
	 */
	public void setRootSearch(boolean searchStatus) {
		Driver.rootSearch = searchStatus;
	}

	/**
	 * This method will set scope of searching
	 * 
	 * @param scope
	 */
	public void setTreeScope(int scope) {
		Driver.scope = scope;
	}

	/**
	 * This method will set search context (Search area in tree)
	 * 
	 * @param element
	 */
	public void setSearchContext(Element element) {
		Driver.searchContext = element;
	}

	/**
	 * This method will find pane
	 * 
	 * @param name
	 * @return
	 */
	public Element getPane(String name) {
		Element winElement = null;
		try {
			winElement = checkPane(name);
			if (winElement != null)
				return winElement;
			else {
				List<Panel> panes = automation.getDesktopObjects();
				Panel pane = panes.get(0);
				int attempt = 10;
				while (!pane.getName().startsWith(name) & attempt > 0) {
					pane = getChildPane(pane);
					attempt--;
				}
				if (pane.getName().startsWith(name)) {
					winElement = pane.getElement();
					winElement.setFocus();
					return winElement;
				}
			}
		} catch (Exception e) {
		}
		return winElement;
	}

	/**
	 * This method will find window
	 * 
	 * @param name
	 * @return
	 */
	public Element getWindow(String name) {
		Element winElement = null;
		try {
			winElement = checkWindow(name);
			if (winElement != null)
				return winElement;
			else {
				List<Window> windows = automation.getDesktopWindows();
				Window window = windows.get(0);
				int attempt = 10;
				while (!window.getName().startsWith(name) & attempt > 0) {
					window = getChildWindow(window);
					attempt--;
				}
				if (window.getName().startsWith(name)) {
					winElement = window.getElement();
					winElement.setFocus();
					return winElement;
				}
			}
		} catch (Exception e) {
		}
		return winElement;
	}

	private Element checkWindow(String name) {
		Element winElement = null;
		try {
			List<Window> windows = automation.getDesktopWindows();
			for (Window window : windows) {
				if (window.getName().startsWith(name)) {
					winElement = window.getElement();
					winElement.setFocus();
					break;
				}
			}
		} catch (Exception e) {
		}
		return winElement;
	}

	private Element checkPane(String name) {
		Element winElement = null;
		try {
			List<Panel> panes = automation.getDesktopObjects();
			for (Panel pane : panes) {
				if (pane.getName().startsWith(name)) {
					winElement = pane.getElement();
					winElement.setFocus();
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return winElement;
	}

	private Window getChildWindow(Window window) {
		Window winElement = null;
		try {
			List<AutomationBase> childWindows = window.getChildren(false);
			if (childWindows.size() != 0) {
				Element element = childWindows.get(0).getElement();
				winElement = new Window(new ElementBuilder(element));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return winElement;
	}

	private Panel getChildPane(Panel pane) {
		Panel paneElement = null;
		try {
			List<AutomationBase> childPanes = pane.getChildren(false);
			if (childPanes.size() != 0) {
				Element element = childPanes.get(0).getElement();
				paneElement = new Panel(new ElementBuilder(element));
			}
		} catch (Exception e) {
		}
		return paneElement;
	}

	/**
	 * This method will return UiElement for given Element
	 * 
	 * @param element
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public UIElement getUIElement(Element element) throws NullPointerException, AutomationException {
		UIElement UIElement = null;
		UIElement = new UIElement(element);
		return UIElement;
	}

	/**
	 * This method will find element with given locator and value
	 * 
	 * @param locatorType
	 * @param controlType
	 * @param value
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public Element findElement(String locatorType, ControlType controlType, String value)
			throws NullPointerException, AutomationException {
		Element element = null;
		switch (locatorType.toUpperCase()) {
		case "NAME":
			element = By.name(controlType, value, "first").get(0);
			break;
		case "ID":
			element = By.id(controlType, value, "first").get(0);
			break;
		case "TEXT":
			element = By.text(controlType, value, "first").get(0);
			break;
		case "VALUE":
			element = By.value(controlType, value, "first").get(0);
			break;
		case "PARTIALNAME":
			element = By.partialName(controlType, value, "first").get(0);
			break;
		case "PARTIALID":
			element = By.partialId(controlType, value, "first").get(0);
			break;
		case "PARTIALTEXT":
			element = By.partialText(controlType, value, "first").get(0);
			break;
		case "PARTIALVALUE":
			element = By.partialValue(controlType, value, "first").get(0);
			break;

		default:
			log.error(locatorType + " - Locator type not exist");
			break;
		}

		return element;
	}

	/**
	 * This method will find element with given locator and value and specified
	 * index
	 * 
	 * @param locatorType
	 * @param controlType
	 * @param value
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 * @author Adhilingappa
	 */
	public Element findElementIndex(String locatorType, ControlType controlType, String value, int index)
			throws NullPointerException, AutomationException {
		Element element = null;
		switch (locatorType.toUpperCase()) {
		case "NAME":
			if (index == 1)
				element = By.name(controlType, value, "all").get(0);
			else if (index == 2)
				element = By.name(controlType, value, "all").get(1);
			else if (index == 3)
				element = By.name(controlType, value, "all").get(2);
			else if (index == 4)
				element = By.name(controlType, value, "all").get(3);
			break;
		case "ID":
			if (index == 1)
				element = By.id(controlType, value, "all").get(0);
			else if (index == 2)
				element = By.id(controlType, value, "all").get(1);
			else if (index == 3)
				element = By.id(controlType, value, "all").get(2);
			else if (index == 4)
				element = By.id(controlType, value, "all").get(3);
			break;
		case "TEXT":
			element = By.text(controlType, value, "first").get(0);
			break;
		case "VALUE":
			element = By.value(controlType, value, "first").get(0);
			break;
		case "PARTIALNAME":
			element = By.partialName(controlType, value, "first").get(0);
			break;
		case "PARTIALID":
			element = By.partialId(controlType, value, "first").get(0);
			break;
		case "PARTIALTEXT":
			element = By.partialText(controlType, value, "first").get(0);
			break;
		case "PARTIALVALUE":
			element = By.partialValue(controlType, value, "first").get(0);
			break;

		default:
			log.error(locatorType + " - Locator type not exist");
			break;
		}

		return element;
	}

	/**
	 * This method will find elements with given locator and value
	 * 
	 * @param locatorType
	 * @param controlType
	 * @param value
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public List<Element> findElements(String locatorType, ControlType controlType, String value)
			throws NullPointerException, AutomationException {
		List<Element> elements = null;
		switch (locatorType.toUpperCase()) {
		case "NAME":
			elements = By.name(controlType, value, "all");
			break;
		case "ID":
			elements = By.id(controlType, value, "all");
			break;
		case "TEXT":
			elements = By.text(controlType, value, "all");
			break;
		case "VALUE":
			elements = By.value(controlType, value, "all");
			break;
		case "PARTIALNAME":
			elements = By.partialName(controlType, value, "all");
			break;
		case "PARTIALID":
			elements = By.partialId(controlType, value, "all");
			break;
		case "PARTIALTEXT":
			elements = By.partialText(controlType, value, "all");
			break;
		case "PARTIALVALUE":
			elements = By.partialValue(controlType, value, "all");
			break;

		default:
			log.error(locatorType + " - Locator type not exist");
			break;
		}

		return elements;
	}

	/**
	 * This method will find element with locator image, location and OCR
	 * 
	 * @param locatorType
	 * @param parameter1
	 * @param parameter2
	 * @return
	 * @throws FindFailed
	 */
	public SikuliElement findSikuliElement(String locatorType, String parameter1, String parameter2) throws FindFailed {

		SikuliElement sikuliElement = null;
		switch (locatorType.toUpperCase()) {
		case "IMAGE":
			sikuliElement = By.image(parameter1, parameter2);
			break;
		case "LOCATION":
			sikuliElement = By.location(Integer.parseInt(parameter1), Integer.parseInt(parameter2));
			break;
		case "OCR":
			sikuliElement = By.OCR(parameter1, parameter2);
			break;

		default:
			log.error(locatorType + " - Locator type not exist");
			break;
		}
		return sikuliElement;
	}
}
