package actions;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import org.sikuli.script.Screen;

import utils.ProjectConfiguration;
import utils.Timer;

/**
 * This class consists of keyboard operation methods
 * 
 * @author Dhanush
 *
 */
public class Keyboard {

	static Screen screen = new Screen();
	static Robot robot = null;
	public static final Map<String, Integer> KEY_CODES = new LinkedHashMap<String, Integer>();

	private static void key(String c, Integer i) {
		KEY_CODES.put(c, i);
	}

	/**
	 * This method will release all the keys in key code list
	 */
	public static void releaseAllKeys() {
		Set<String> keys = KEY_CODES.keySet();
		for (String key : keys) {
			int keyCode = (int) KEY_CODES.get(key);
			if (robot == null)
				robot = getRobot();
			robot.keyRelease(keyCode);
			robot.waitForIdle();
		}
	}

	static {
		key("a", KeyEvent.VK_A);
		key("b", KeyEvent.VK_B);
		key("c", KeyEvent.VK_C);
		key("d", KeyEvent.VK_D);
		key("e", KeyEvent.VK_E);
		key("f", KeyEvent.VK_F);
		key("g", KeyEvent.VK_G);
		key("h", KeyEvent.VK_H);
		key("i", KeyEvent.VK_I);
		key("j", KeyEvent.VK_J);
		key("k", KeyEvent.VK_K);
		key("l", KeyEvent.VK_L);
		key("m", KeyEvent.VK_M);
		key("n", KeyEvent.VK_N);
		key("o", KeyEvent.VK_O);
		key("p", KeyEvent.VK_P);
		key("q", KeyEvent.VK_Q);
		key("r", KeyEvent.VK_R);
		key("s", KeyEvent.VK_S);
		key("t", KeyEvent.VK_T);
		key("u", KeyEvent.VK_U);
		key("v", KeyEvent.VK_V);
		key("w", KeyEvent.VK_W);
		key("x", KeyEvent.VK_X);
		key("y", KeyEvent.VK_Y);
		key("z", KeyEvent.VK_Z);
		// ===================================
		key("control", KeyEvent.VK_CONTROL);
		key("alt", KeyEvent.VK_ALT);
		key("shift", KeyEvent.VK_SHIFT);
		key("tab", KeyEvent.VK_TAB);
		key("enter", KeyEvent.VK_ENTER);
		key("space", KeyEvent.VK_SPACE);
		key("backspace", KeyEvent.VK_BACK_SPACE);
		key("up", KeyEvent.VK_UP);
		key("right", KeyEvent.VK_RIGHT);
		key("down", KeyEvent.VK_DOWN);
		key("left", KeyEvent.VK_LEFT);
		key("pageup", KeyEvent.VK_PAGE_UP);
		key("pagedown", KeyEvent.VK_PAGE_DOWN);
		key("end", KeyEvent.VK_END);
		key("home", KeyEvent.VK_HOME);
		key("delete", KeyEvent.VK_DELETE);
		key("escape", KeyEvent.VK_ESCAPE);
		key("insert", KeyEvent.VK_INSERT);
		// ====================================
		key("fn", KeyEvent.VK_F);
		key("f1", KeyEvent.VK_F1);
		key("f2", KeyEvent.VK_F2);
		key("f3", KeyEvent.VK_F3);
		key("f4", KeyEvent.VK_F4);
		key("f5", KeyEvent.VK_F5);
		key("f6", KeyEvent.VK_F6);
		key("f7", KeyEvent.VK_F7);
		key("f8", KeyEvent.VK_F8);
		key("f9", KeyEvent.VK_F9);
		key("f10", KeyEvent.VK_F10);
		key("f11", KeyEvent.VK_F11);
		key("f12", KeyEvent.VK_F12);
	}

	/**
	 * This will return the robot object
	 * 
	 * @return
	 */
	public static Robot getRobot() {
		try {
			robot = new Robot();
		} catch (AWTException e) {
			e.printStackTrace();
		}
		return robot;
	}

	private static int getKey(String key) {
		return (int) KEY_CODES.get(key.toLowerCase());
	}

	private static void keyPress(String key) {
		if (robot == null)
			robot = getRobot();
		int Key = getKey(key);
		robot.keyPress(Key);
		robot.waitForIdle();
	}

	private static void keyRelease(String key) {
		if (robot == null)
			robot = getRobot();
		int Key = getKey(key);
		robot.keyRelease(Key);
		robot.waitForIdle();
	}

	/**
	 * This will press given key
	 * 
	 * @param key
	 */
	public static void specialKeyPress(String key) {
		Timer.waitTime(300);
		keyPress(key);
		keyRelease(key);
		Timer.waitTime(300);
	}

	/**
	 * This method will press given keys
	 * 
	 * @param Key_1
	 * @param Key_2
	 */
	public static void specialKeyPress(String Key_1, String Key_2) {
		Timer.waitTime(300);
		Keyboard.keyPress(Key_1);
		Keyboard.keyPress(Key_2);

		Keyboard.keyRelease(Key_2);
		Keyboard.keyRelease(Key_1);
		Timer.waitTime(300);
	}

	/**
	 * This method will press given keys
	 * 
	 * @param Key_1
	 * @param Key_2
	 * @param Key_3
	 */
	public static void specialKeyPress(String Key_1, String Key_2, String Key_3) {
		Timer.waitTime(300);
		Keyboard.keyPress(Key_1);
		Keyboard.keyPress(Key_2);
		Keyboard.keyPress(Key_3);

		Keyboard.keyRelease(Key_1);
		Keyboard.keyRelease(Key_2);
		Keyboard.keyRelease(Key_3);
		Timer.waitTime(300);
	}

	/**
	 * This method will clear the content in the text edit area
	 */
	public static void clear() {
		keyPress("CONTROL");
		keyPress("A");
		keyRelease("A");
		keyRelease("CONTROL");
		keyPress("DELETE");
		keyRelease("DELETE");
	}

	/**
	 * This method will type the given text
	 * 
	 * @param text
	 */
	public static void type(String text) {
		if (text.endsWith("Base-Files"))
			text = ProjectConfiguration.base_Files.getAbsolutePath();
		screen.type(text);
	}

	/**
	 * This method will paste the given text
	 * 
	 * @param text
	 */
	public static void paste(String text) {
		if (text.endsWith("Base-Files"))
			text = ProjectConfiguration.base_Files.getAbsolutePath();
		Keyboard.clear();
		screen.paste(text);
	}
}