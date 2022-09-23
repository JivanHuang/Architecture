//
//  NSPredicateExtensions.swift
//  Architecture
//
//  Created by Jivan on 2022/9/23.
//

#if canImport(Foundation)
import Foundation

// MARK: - Properties

public extension NSPredicate {
    var not: NSCompoundPredicate {
        return NSCompoundPredicate(notPredicateWithSubpredicate: self)
    }
}

// MARK: - Methods

public extension NSPredicate {
    func and(_ predicate: NSPredicate) -> NSCompoundPredicate {
        return NSCompoundPredicate(andPredicateWithSubpredicates: [self, predicate])
    }

    func or(_ predicate: NSPredicate) -> NSCompoundPredicate {
        return NSCompoundPredicate(orPredicateWithSubpredicates: [self, predicate])
    }
}

// MARK: - Operators

public extension NSPredicate {
    static prefix func ! (rhs: NSPredicate) -> NSCompoundPredicate {
        return rhs.not
    }

    static func + (lhs: NSPredicate, rhs: NSPredicate) -> NSCompoundPredicate {
        return lhs.and(rhs)
    }

    static func | (lhs: NSPredicate, rhs: NSPredicate) -> NSCompoundPredicate {
        return lhs.or(rhs)
    }

    static func - (lhs: NSPredicate, rhs: NSPredicate) -> NSCompoundPredicate {
        return lhs + !rhs
    }
}

#endif
