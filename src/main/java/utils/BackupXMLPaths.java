package utils;

import java.util.List;

public class BackupXMLPaths {

	/**
	 * this class contains all backup XML paths variable and method to load XML path
	 * for offline module and capture module
	 * 
	 * @author adhilingappa
	 */

	public static String epiSimDoc;
	public static String newCapturePreference;
	public static String captureSettings;
	public static String autoSecurityKeys;
	public static String exclusionFilterPreference;
	public static String IEAdaptor;
	public static String KeyClubbing;
	public static String ImageSetting;
	public static String DialogRules;
	public static String ClawAdopter;
	public static String AdaptorInfo;
	public static String EventLogger;
	public static String UserSettings;
	public static String STTSettings;


	public static List<String> offileBackupPaths;
	public static List<String> captureBackupPaths;

	public static List<String> loadOfflineBackUpPaths() {
		offileBackupPaths.add(newCapturePreference);
		offileBackupPaths.add(autoSecurityKeys);
		offileBackupPaths.add(epiSimDoc);

		return offileBackupPaths;
	}

	public static List<String> loadCaptureBackupPaths() {

		captureBackupPaths.add(captureSettings);
		return captureBackupPaths;
	}

	

}
