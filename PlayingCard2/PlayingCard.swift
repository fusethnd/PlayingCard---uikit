//
//  PlayingCard.swift
//  PlayingCard2
//
//  Created by Thanadon Boontawee on 9/6/2567 BE.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    var description: String {
        return "\(rank)\(suit)"
    }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
//        var description: String
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.spades,.hearts,.diamonds,.clubs]
        
        var description: String { return rawValue }
    }
    
    enum Rank: CustomStringConvertible {
//        var description: String
        
        case ace // A
        case face(String) // J,Q,K
        case numeric(Int) // 2-10

        var order: Int {
            switch self {
                case .ace: return 1
                case .numeric(let pips): return pips
                // return number directly
                case .face(let kind) where kind == "J": return 11
                case .face(let kind) where kind == "Q": return 12
                case .face(let kind) where kind == "K": return 13
                default: return 0
            }
        }
        
        static var all: [Rank] { // when all method is called
            var allRanks = [Rank.ace]
            // start allRanks value with 1 item - array that value is ace
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
                // append 2-10 value into allRanks
            }
            allRanks += [Rank.face("J"),.face("Q"),.face("K")]
            // appends J,Q,K at last and return array
            return allRanks
        }
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let pips): return String(pips)
            case .face(let kind) : return kind
            }
        }
    }
}
