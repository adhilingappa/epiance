package core;

import java.awt.Rectangle;
import java.util.ArrayList;
import java.util.List;

import org.sikuli.script.FindFailed;
import org.sikuli.script.Region;

import com.sun.jna.platform.win32.OleAuto;
import com.sun.jna.platform.win32.Variant;
import com.sun.jna.platform.win32.WTypes;
import com.sun.jna.ptr.PointerByReference;

import mmarquee.automation.AutomationException;
import mmarquee.automation.ControlType;
import mmarquee.automation.Element;
import mmarquee.automation.PropertyID;
import mmarquee.uiautomation.TreeScope;
import utils.ProjectConfiguration;

/**
 * This class consists of element finding logic methods
 * 
 * @author Dhanush
 *
 */
public class By {

	/**
	 * This method will return first matching element
	 * 
	 * @param pointerByReference
	 * @return Element
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	private static Element findFirst(PointerByReference pointerByReference)
			throws NullPointerException, AutomationException {
		Element element = null;
		for (int loop = 0; loop < Driver.searchAttempts; loop++) {
			try {
				if (Driver.rootSearch)
					element = Driver.rootElement.findFirst(new TreeScope(Driver.scope), pointerByReference);
				else
					element = Driver.searchContext.findFirst(new TreeScope(Driver.scope), pointerByReference);
			} catch (AutomationException e1) {
			}
			if (element != null) {
				break;
			}
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
			}
		}
		if (element == null)
			throw new NullPointerException("Element is null");
		return element;
	}

	/**
	 * This method will find all matching elements
	 * 
	 * @param pointerByReference
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	private static List<Element> findAll(PointerByReference pointerByReference)
			throws NullPointerException, AutomationException {
		List<Element> elements = null;

		for (int loop = 0; loop < Driver.searchAttempts; loop++) {
			try {
				if (Driver.rootSearch)
					elements = Driver.rootElement.findAll(new TreeScope(Driver.scope), pointerByReference);
				else
					elements = Driver.searchContext.findAll(new TreeScope(Driver.scope), pointerByReference);
			} catch (AutomationException e1) {
			}
			if (elements.size() != 0)
				break;
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
			}
		}
		if (elements.size() == 0) {
			elements = null;
			throw new NullPointerException("Element is null");
		}
		return elements;
	}

	/**
	 * This method will return given value from element
	 * 
	 * @param element
	 * @param locator
	 * @return
	 */
	private static String getValue(Element element, String locator) {
		String value = null;
		locator = locator.toUpperCase();
		try {
			if (locator.equals("NAME"))
				value = element.getName();
			else if (locator.equals("ID"))
				value = element.getAutomationId();
			else if (locator.equals("TEXT"))
				value = element.getPropertyValue(PropertyID.HelpText.getValue()).toString();
			else if (locator.equals("VALUE"))
				value = element.getPropertyValue(PropertyID.LegacyIAccessibleValue.getValue()).toString();
		} catch (AutomationException e) {
		}
		return value;
	}

	/**
	 * This method will find element with partial matches
	 * 
	 * @param pointerByReference
	 * @param locator
	 * @param value
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	private static List<Element> findPartial(PointerByReference pointerByReference, String locator, String value)
			throws NullPointerException, AutomationException {
		List<Element> foundElements = new ArrayList<Element>();
		List<Element> elements = null;
		elements = findAll(pointerByReference);
		for (Element element : elements) {
			if (getValue(element, locator).contains(value))
				foundElements.add(element);
		}
		if (foundElements.size() == 0)
			foundElements = null;

		return foundElements;
	}

	/**
	 * This method will find element with help text attribute
	 * 
	 * @param controlType
	 * @param value
	 * @param find
	 * @return
	 * @throws AutomationException
	 */
	public static List<Element> text(ControlType controlType, String value, String find) throws AutomationException {
		PointerByReference pointerByReference = null;
		List<Element> elements = new ArrayList<Element>();

		Variant.VARIANT.ByValue variant = new Variant.VARIANT.ByValue();
		WTypes.BSTR sysAllocated = OleAuto.INSTANCE.SysAllocString(value);
		variant.setValue(Variant.VT_BSTR, sysAllocated);

		pointerByReference = Driver.automation.createAndCondition(
				Driver.automation.createPropertyCondition(PropertyID.HelpText.getValue(), variant),
				Driver.automation.createControlTypeCondition(controlType));

		if (find.equals("first"))
			elements.add(findFirst(pointerByReference));
		else if (find.equals("all"))
			elements.addAll(findAll(pointerByReference));
		return elements;
	}

	/**
	 * This method will find element with value attribute
	 * 
	 * @param controlType
	 * @param value
	 * @param find
	 * @return
	 * @throws AutomationException
	 */
	public static List<Element> value(ControlType controlType, String value, String find) throws AutomationException {
		PointerByReference pointerByReference = null;
		List<Element> elements = new ArrayList<Element>();

		Variant.VARIANT.ByValue variant = new Variant.VARIANT.ByValue();
		WTypes.BSTR sysAllocated = OleAuto.INSTANCE.SysAllocString(value);
		variant.setValue(Variant.VT_BSTR, sysAllocated);

		pointerByReference = Driver.automation.createAndCondition(
				Driver.automation.createPropertyCondition(PropertyID.LegacyIAccessibleValue.getValue(), variant),
				Driver.automation.createControlTypeCondition(controlType));

		if (find.equals("first"))
			elements.add(findFirst(pointerByReference));
		else if (find.equals("all"))
			elements.addAll(findAll(pointerByReference));
		return elements;
	}

	/**
	 * This method will find element with value attribute
	 * 
	 * @param controlType
	 * @param value
	 * @param find
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public static List<Element> name(ControlType controlType, String value, String find)
			throws NullPointerException, AutomationException {
		PointerByReference pointerByReference = null;
		List<Element> elements = new ArrayList<Element>();
		pointerByReference = Driver.automation.createAndCondition(Driver.automation.createNamePropertyCondition(value),
				Driver.automation.createControlTypeCondition(controlType));

		if (find.equals("first"))
			elements.add(findFirst(pointerByReference));
		else if (find.equals("all"))
			elements.addAll(findAll(pointerByReference));
		return elements;
	}

	/**
	 * This method will find element with id attribute
	 * 
	 * @param controlType
	 * @param value
	 * @param find
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public static List<Element> id(ControlType controlType, String value, String find)
			throws NullPointerException, AutomationException {
		PointerByReference pointerByReference = null;
		List<Element> elements = new ArrayList<Element>();
		pointerByReference = Driver.automation.createAndCondition(
				Driver.automation.createAutomationIdPropertyCondition(value),
				Driver.automation.createControlTypeCondition(controlType));

		if (find.equals("first"))
			elements.add(findFirst(pointerByReference));
		else if (find.equals("all"))
			elements.addAll(findAll(pointerByReference));
		return elements;
	}

	/**
	 * This method will find element with partial name as attribute
	 * 
	 * @param controlType
	 * @param value
	 * @param find
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public static List<Element> partialName(ControlType controlType, String value, String find)
			throws NullPointerException, AutomationException {
		PointerByReference pointerByReference = null;
		List<Element> elements = new ArrayList<Element>();
		pointerByReference = Driver.automation.createControlTypeCondition(controlType);

		if (find.equals("first"))
			elements.add(findPartial(pointerByReference, "name", value).get(0));
		else if (find.equals("all"))
			elements.addAll(findPartial(pointerByReference, "name", value));
		return elements;
	}

	/**
	 * This method will find element with partial id attribute
	 * 
	 * @param controlType
	 * @param value
	 * @param find
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public static List<Element> partialId(ControlType controlType, String value, String find)
			throws NullPointerException, AutomationException {
		PointerByReference pointerByReference = null;
		List<Element> elements = new ArrayList<Element>();
		pointerByReference = Driver.automation.createControlTypeCondition(controlType);

		if (find.equals("first"))
			elements.add(findPartial(pointerByReference, "id", value).get(0));
		else if (find.equals("all"))
			elements.addAll(findPartial(pointerByReference, "id", value));
		return elements;
	}

	/**
	 * This method will find element with partial text attribute
	 * 
	 * @param controlType
	 * @param value
	 * @param find
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public static List<Element> partialText(ControlType controlType, String value, String find)
			throws NullPointerException, AutomationException {
		PointerByReference pointerByReference = null;
		List<Element> elements = new ArrayList<Element>();
		pointerByReference = Driver.automation.createControlTypeCondition(controlType);

		if (find.equals("first"))
			elements.add(findPartial(pointerByReference, "text", value).get(0));
		else if (find.equals("all"))
			elements.addAll(findPartial(pointerByReference, "text", value));
		return elements;
	}

	/**
	 * This method will find element with partial value attribute
	 * 
	 * @param controlType
	 * @param value
	 * @param find
	 * @return
	 * @throws NullPointerException
	 * @throws AutomationException
	 */
	public static List<Element> partialValue(ControlType controlType, String value, String find)
			throws NullPointerException, AutomationException {
		PointerByReference pointerByReference = null;
		List<Element> elements = new ArrayList<Element>();
		pointerByReference = Driver.automation.createControlTypeCondition(controlType);

		if (find.equals("first"))
			elements.add(findPartial(pointerByReference, "value", value).get(0));
		else if (find.equals("all"))
			elements.addAll(findPartial(pointerByReference, "value", value));
		return elements;
	}

	/**
	 * This method will find element with image
	 * 
	 * @param searchImage
	 * @param findImage
	 * @return
	 * @throws FindFailed
	 */
	public static SikuliElement image(String searchImage, String findImage) throws FindFailed {
		String basePath = ProjectConfiguration.sikuliImageBasePath + "\\";
		Region region = null;
		Rectangle rect;
		if (searchImage.toUpperCase().equals("SCREEN")) {
			region = SikuliElement.screen.find(basePath + findImage);
		} else {
			rect = SikuliElement.screen.find(basePath + searchImage).find(basePath + findImage).getRect();
			region = new Region(rect);
		}
		return new SikuliElement(region);
	}

	/**
	 * This method will find element with OCR
	 * 
	 * @param searchImage
	 * @param text
	 * @return
	 * @throws FindFailed
	 */
	public static SikuliElement OCR(String searchImage, String text) throws FindFailed {
		String basePath = ProjectConfiguration.sikuliImageBasePath + "\\";
		Region region = null;
		Rectangle rect;
		if (searchImage.toUpperCase().equals("SCREEN")) {
			region = SikuliElement.screen.findT(text);
		} else {
			rect = SikuliElement.screen.find(basePath + searchImage).findT(text).getRect();
			region = new Region(rect);
		}
		return new SikuliElement(region);
	}

	/**
	 * This method will find element with x and y coordinates
	 * 
	 * @param x
	 * @param y
	 * @return
	 * @throws FindFailed
	 */
	public static SikuliElement location(int x, int y) throws FindFailed {
		Region region = new Region(x, y);
		return new SikuliElement(region);
	}
}
