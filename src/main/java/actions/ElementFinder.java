package actions;

import java.util.HashSet;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.sikuli.script.FindFailed;

import core.Controls;
import core.Driver;
import core.SikuliElement;
import core.UIElement;
import mmarquee.automation.AutomationException;
import mmarquee.automation.Element;
import mmarquee.automation.pattern.Window;

/**
 * This class consists of all element finding methods
 * 
 * @author Dhanush
 *
 */
public class ElementFinder {

	private static final Logger log = LogManager.getLogger(ElementFinder.class);
	private Driver driver;

	public ElementFinder(Driver driver) {
		this.driver = driver;
	}

	/**
	 * This method will maximize the window
	 * 
	 * @param windowTitle
	 * @param findWait
	 */
	public void maximizeWindow(String windowTitle, long findWait) {
		Element element = getWindow(windowTitle, findWait);
		try {
			new Window(element).maximize();
		} catch (AutomationException e) {
			throw new RuntimeException();
		}
	}

	/**
	 * This method will close the window
	 * 
	 * @param windowTitle
	 * @param findWait
	 */
	public void closeWindow(String windowTitle, long findWait) {
		Element element = getWindow(windowTitle, findWait);
		try {
			new Window(element).close();
		} catch (AutomationException e) {
			throw new RuntimeException();
		}
	}

	Set<Element> windowList = new HashSet<Element>();

	private Element checkWindowList(String windowTitle) {

		for (Element window : windowList) {
			try {
				String title = window.getName();
				if (title.startsWith(windowTitle)) {
					return window;
				}

			} catch (AutomationException e) {
			}
		}
		return null;
	}

	/**
	 * focusWindow will get element for given control information with given time
	 * 
	 * @return
	 */
	public Element getWindow(String windowTitle, long duration) {

		Element element = checkWindowList(windowTitle);
		if (element != null)
			return element;
		duration = 1000 * duration;
		long start = System.currentTimeMillis();
		while (element == null) {
			element = driver.getWindow(windowTitle);
			if (element != null) {
				windowList.add(element);
				return element;
			}
			if (System.currentTimeMillis() - start > duration) {
				System.err.println(String.format(windowTitle + " not found within %s s", duration / 1000));
				log.error(String.format(windowTitle + " not found within %s s", duration / 1000));
				break;
			}
		}

		return element;
	}

	Set<Element> panesList = new HashSet<Element>();

	private Element checkPaneList(String windowTitle) {
		for (Element window : panesList) {
			try {
				String title = window.getName();
				if (title.startsWith(windowTitle)) {
					return window;
				}

			} catch (AutomationException e) {
			}
		}
		return null;
	}

	/**
	 * focusPane will get element for given control information with given time
	 * 
	 * @return
	 */
	public Element getPane(String paneTitle, long duration) {
		Element element = checkPaneList(paneTitle);
		if (element != null)
			return element;
		duration = 1000 * duration;
		long start = System.currentTimeMillis();
		while (element == null) {
			element = driver.getPane(paneTitle);
			if (element != null) {
				panesList.add(element);
				return element;
			}
			if (System.currentTimeMillis() - start > duration) {
				System.err.println(String.format(paneTitle + " not found within %s s", duration / 1000));
				log.error(String.format(paneTitle + " not found within %s s", duration / 1000));
				break;
			}
		}

		return element;
	}

	/**
	 * getSikuliElement will get element for given control information with given
	 * time
	 * 
	 * @return
	 */
	public SikuliElement getSikuliElement(String locatorType, String parameter1, String parameter2, long duration) {
		duration = 1000 * duration;
		long start = System.currentTimeMillis();
		while (true) {
			try {
				return driver.findSikuliElement(locatorType, parameter1, parameter2);
			} catch (FindFailed e) {
			}
			if (System.currentTimeMillis() - start > duration) {
				System.err.println(
						String.format(parameter1 + " - " + parameter2 + " not found within %s s", duration / 1000));
				log.error(String.format(parameter1 + " - " + parameter2 + " not found within %s s", duration / 1000));
				break;
			}
		}

		return null;
	}

	/**
	 * getUIElement will get element for given control information with given time
	 * 
	 * @return
	 */
	public UIElement getUIElement(String locatorType, String controlType, String value, long duration) {
		System.out.println(duration + " Duration");
		duration = 1000 * duration;
		long start = System.currentTimeMillis();
		while (true) {
			try {
				UIElement element = new UIElement(
						driver.findElement(locatorType, Controls.getControl(controlType), value));
				return element;
			} catch (NullPointerException | AutomationException e) {
			}
			if (System.currentTimeMillis() - start > duration) {
				System.err.println(
						String.format(controlType + " - " + value + " not found within %s s", duration / 1000));
				log.error(String.format(controlType + " - " + value + " not found within %s s", duration / 1000));
				break;
			}
		}
		return null;
	}
	/**
	 * getUIElement will get element for given control information with given time
	 * 
	 * @return
	 * @author Adhilingappa
	 */
	public UIElement getUIElementIndex(String locatorType, String controlType, String value, long duration , int index) 
	{
		System.out.println(duration + " Duration");
		duration = 1000 * duration;
		long start = System.currentTimeMillis();
		while (true) {
			try {
				UIElement element = new UIElement(
						driver.findElementIndex(locatorType, Controls.getControl(controlType), value , index));
				return element;
			} catch (NullPointerException | AutomationException e) {
			}
			if (System.currentTimeMillis() - start > duration) {
				System.err.println(
						String.format(controlType + " - " + value + " not found within %s s", duration / 1000));
				log.error(String.format(controlType + " - " + value + " not found within %s s", duration / 1000));
				break;
			}
		}
		return null;
	}

	/**
	 * This method will return UiElement or SikuliElement
	 * 
	 * @param <T>
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 * @param duration
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T extends SikuliElement> T getElement(String locatorType, String parameter1, String parameter2,
			long duration) {
		locatorType = locatorType.toUpperCase();
		if (locatorType.equals("IMAGE") | locatorType.equals("LOCATION") | locatorType.equals("OCR")) {
			return (T) getSikuliElement(locatorType, parameter1, parameter2, duration);
		} else {
			return (T) getUIElement(locatorType, parameter1, parameter2, duration);
		}
	}
	/**
	 * This method will return UiElement or SikuliElement
	 * 
	 * @param <T>
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 * @param duration
	 * @return
	 * @author Adhilingappa
	 */
	@SuppressWarnings("unchecked")
	public <T extends SikuliElement> T getElementIndex(String locatorType, String parameter1, String parameter2,
			long duration , int index) {
		locatorType = locatorType.toUpperCase();
		if (locatorType.equals("IMAGE") | locatorType.equals("LOCATION") | locatorType.equals("OCR")) {
			return (T) getSikuliElement(locatorType, parameter1, parameter2, duration);
		} else {
			return (T) getUIElementIndex(locatorType, parameter1, parameter2, duration , index);
		}
	}

	/**
	 * This method will wait to display the given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 * @param duration
	 * @return
	 */
	public boolean waitToDisplay(String locatorType, String parameter1, String parameter2, long duration) {
		return display(locatorType, parameter1, parameter2, duration);
	}

	/**
	 * This method will wait to vanish the given element
	 * 
	 * @param locatorType
	 * @param parameter1  - control type or search area image or coordinate-X value
	 * @param parameter2  - control value or search element image or coordinate-Y
	 * @param duration
	 * @return
	 */
	public boolean waitToVanish(String locatorType, String parameter1, String parameter2, long duration) {
		return vanish(locatorType, parameter1, parameter2, duration);
	}

	private boolean vanish(String locatorType, String parameter1, String parameter2, long duration) {
		boolean isVanished = false;
		duration = 1000 * duration;
		long start = System.currentTimeMillis();
		while (!isVanished) {
			try {
				locatorType = locatorType.toUpperCase();
				SikuliElement sikuliElement = null;
				if (locatorType.equals("IMAGE") | locatorType.equals("LOCATION") | locatorType.equals("OCR"))
					sikuliElement = driver.findSikuliElement(locatorType, parameter1, parameter2);
				else
					sikuliElement = new UIElement(
							driver.findElement(locatorType, Controls.getControl(parameter1), parameter2));
				if (sikuliElement != null & sikuliElement.isVanished())
					return true;

			} catch (FindFailed | NullPointerException | AutomationException e) {
				return true;
			}
			if (System.currentTimeMillis() - start > duration) {
				System.err.println(String.format(parameter2 + " not vanished within %s s", duration / 1000));
				log.error(String.format(parameter2 + " not vanished within %s s", duration / 1000));
				break;
			}
		}
		return false;
	}

	private boolean display(String locatorType, String parameter1, String parameter2, long duration) {
		duration = 1000 * duration;
		long start = System.currentTimeMillis();
		while (true) {
			try {
				locatorType = locatorType.toUpperCase();
				SikuliElement sikuliElement = null;
				if (locatorType.equals("IMAGE") | locatorType.equals("LOCATION") | locatorType.equals("OCR"))
					sikuliElement = driver.findSikuliElement(locatorType, parameter1, parameter2);
				else
					sikuliElement = new UIElement(
							driver.findElement(locatorType, Controls.getControl(parameter1), parameter2));
				if (sikuliElement != null & sikuliElement.isDisplayed())
					return true;

			} catch (FindFailed | NullPointerException | AutomationException e) {

			}
			if (System.currentTimeMillis() - start > duration) {
				System.err.println(String.format(parameter2 + " not displyed within %s s", duration / 1000));
				log.error(String.format(String.format(parameter2 + " not displyed within %s s", duration / 1000)));
				break;
			}
		}
		return false;
	}

	/**
	 * This method will wait to enable given element
	 * 
	 * @param locatorType
	 * @param controlType
	 * @param value
	 * @param duration
	 * @return
	 */
	public boolean waitToEnable(String locatorType, String controlType, String value, long duration) {
		UIElement uiElement = null;
		duration = 1000 * duration;
		long start = System.currentTimeMillis();
		while (true) {
			try {
				Element element = driver.findElement(locatorType, Controls.getControl(controlType), value);
				uiElement = new UIElement(element);
				if (uiElement != null & uiElement.isEnabled())
					return true;
			} catch (NullPointerException | AutomationException e) {
			}
			if (System.currentTimeMillis() - start > duration) {
				System.err.println(String.format(value + " not enabled within %s s", duration / 1000));
				log.error(String.format(value + " not enabled within %s s", duration / 1000));
				break;
			}
		}
		return false;
	}
}
