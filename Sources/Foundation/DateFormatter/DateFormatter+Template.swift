import Foundation

public extension DateFormatter {
	
	/**
	A convenient way to create a DateFormatter from template, with autoupdating
	current locale and autoupdating current time zone.
	
	- parameter template: A string containing date format patterns (such as
	"MM" or "h"). Note that the template string is used only to specify which
	date format components should be included. Ordering and other text will
	not be preserved.
	- parameter options: No options are currently defined.
	- parameter locale: The locale for which the template is required,
	default value is autoupdatingCurrent (a locale which tracks the user’s
	current preferences).
	- parameter timeZone: The time zone for the new formatter, default value
	is autoupdatingCurrent (the time zone currently used by the system,
	automatically updating to the user’s current preference).
	*/
	convenience init(
		template: String,
		options: Int = 0,
		locale: Locale = .autoupdatingCurrent,
		timeZone: TimeZone = .autoupdatingCurrent
	) {
		self.init()
		self.timeZone = timeZone
		self.dateFormat = DateFormatter.dateFormat(
			fromTemplate: template,
			options: options,
			locale: locale
		)
	}
	
}
