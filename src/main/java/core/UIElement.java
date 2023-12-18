package core;

import java.awt.Rectangle;

import org.sikuli.script.FindFailed;
import org.sikuli.script.Region;

import mmarquee.automation.AutomationException;
import mmarquee.automation.Element;
import mmarquee.automation.pattern.Toggle;
import mmarquee.uiautomation.ToggleState;

public class UIElement extends SikuliElement {

	private Element element;
	public static int scale;

	public UIElement(Element inElement) {
		super(getRegion(inElement));
		this.element = inElement;
	}

	private static Region getRegion(Element element) {
		Region region = null;
		try {
			Rectangle rect = element.getBoundingRectangle().toRectangle();

			// Check if Settings.SCALE is zero before performing the division.
			int x = (scale == 0) ? 0 : (rect.x * 100) / scale;
			int y = (scale == 0) ? 0 : (rect.y * 100) / scale;
			int height = (scale == 0) ? 0 : (rect.height * 100) / scale;
			int width = (scale == 0) ? 0 : (rect.width * 100) / scale;

			region = new Region(x, y, width, height);
//	        region.highlight(1);
		} catch (AutomationException e) {
			// Handle AutomationException if needed.
			// log.error("Error occurred while getting region.", e);
		}
		return region;
	}
//	private static Region getRegion(Element element) {
//		Rectangle rect = null;
//		try {
//			rect = element.getBoundingRectangle().toRectangle();
//		} catch (AutomationException e) {
//
//		}
//		return new Region(rect);
//	}

	public void check() throws AutomationException, FindFailed {
		Toggle toggle = new Toggle(element);
		ToggleState state = toggle.currentToggleState();
		int value = state.getValue();
		if (value == 0) {
			click();
		}
	}

	public void unCheck() throws AutomationException, FindFailed {
		Toggle toggle = new Toggle(element);
		ToggleState state = toggle.currentToggleState();
		int value = state.getValue();
		if (value == 1) {
			click();
		}
	}

	public void toggle(String state) throws AutomationException, FindFailed {
		int stat = Integer.parseInt(state);
		Toggle toggle = new Toggle(element);
		ToggleState toggleState = toggle.currentToggleState();
		int value = toggleState.getValue();
		if (value != stat) {
			click();
		}
	}

	public boolean isEnabled() throws AutomationException {
		boolean status = false;
		if (element != null) {
			status = element.isEnabled();
		}
		return status;
	}

	public String getName() throws AutomationException {
		return element.getName();
	}

	public String getAutomationId() throws AutomationException {
		return element.getAutomationId();
	}

	public void setFocus() {
		element.setFocus();
	}

}
