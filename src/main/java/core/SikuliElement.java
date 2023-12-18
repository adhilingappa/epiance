package core;

import org.sikuli.script.FindFailed;
import org.sikuli.script.Region;
import org.sikuli.script.Screen;

import actions.Keyboard;

public class SikuliElement {

	public static Screen screen = new Screen();
	private Region region;

	public SikuliElement(Region region) {
		this.region = region;
	}

	public Region getRegion() {
		return region;
	}

	public void click() {
		region.getBottomLeft().right(5).above(5).click();
	}

	public void clickCenter() {
		region.getCenter().click();
	}

	public void clickRight() {
		region.getBottomRight().above(5).click();
	}

	public void rightClick() {
		region.rightClick();
	}

	public void doubleClick() {
		region.doubleClick();
	}

	public void hover() {
		region.hover();
	}

	public void drag() {
		try {
			screen.drag(region);
		} catch (FindFailed e) {
			System.out.println("Exception in Drag :- " + e.getMessage());
		}
	}

	public void dropAt() {
		try {
			screen.dropAt(region);
		} catch (FindFailed e) {
			System.out.println("Exception in Drag :- " + e.getMessage());
		}
	}

	public void highlight(double duration) {
		region.highlight(duration);
	}

	public boolean isDisplayed() {
		return region.isValid();
	}

	public boolean isVanished() {
		return screen.isVirtual();
	}

	public void clear() {
		clickCenter();
		Keyboard.clear();
	}

	public void write(String text) {
		clear();
		screen.type(text);
	}

	public void swipeUp(int steps) {
		click();
		Keyboard.getRobot().mouseWheel(-steps);
	}

	public void swipeDown(int steps) {
		click();
		Keyboard.getRobot().mouseWheel(steps);
	}

}
