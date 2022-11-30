//
//  CoreDataManager.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 30.11.2022.
//
import CoreData
import UIKit


enum CoreDataKeys: String {
    case episode
    case season
    case episodeTitle
    case note
}

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private let managedContext: NSManagedObjectContext!
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        
    }
    
    func saveEpisode(episode: Int8, season: Int8, episodeTitle: String, note: Int8) -> EpisodeNote? {
        let entity = NSEntityDescription.entity(forEntityName: "EpisodeNote", in: managedContext)!
        let episodeNote = NSManagedObject(entity: entity, insertInto: managedContext)
        episodeNote.setValue( episode,forKeyPath: CoreDataKeys.episode.rawValue)
        episodeNote.setValue(season, forKeyPath: CoreDataKeys.season.rawValue)
        episodeNote.setValue(episodeTitle, forKeyPath: CoreDataKeys.episodeTitle.rawValue)
        episodeNote.setValue(note, forKeyPath: CoreDataKeys.note.rawValue)
        
        do {
            try managedContext.save()
            return episodeNote as? EpisodeNote
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return nil
    }
    
    func getEpisodes() -> [EpisodeNote] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "EpisodeNote")
        
        do {
            let episodes = try managedContext.fetch(fetchRequest)
            return episodes as! [EpisodeNote]
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    func deleteEpisode(deleteItemID: UUID) {
        getEpisodes().forEach { episode in
            if episode.id == deleteItemID {
                managedContext.delete(episode)
                try! managedContext.save()
            }
        }
    }
    
}
