import Foundation

public extension UserDefaults {
	
	/// Get and set an object from UserDefaults by using subscript.
	subscript<T>(key: String) -> T? {
		get {
			value(forKey: key) as? T
		}
		set {
			set(newValue, forKey: key)
		}
	}
	
	/// Get and set an _RawRepresentable_ object from UserDefaults by using subscript.
	subscript<T: RawRepresentable>(key: String) -> T? {
		get {
			guard let rawValue = value(forKey: key) as? T.RawValue else {
				return nil
			}
			return T(rawValue: rawValue)
		}
		set {
			set(newValue?.rawValue, forKey: key)
		}
	}
	
}
