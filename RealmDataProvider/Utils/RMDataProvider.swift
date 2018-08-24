
import Realm
import RealmSwift
import RxSwift
import RxRealm

final class RMDataProvider<T: Object> {
    private let scheduler: ImmediateSchedulerType
    private let realm: Realm
    
    init(realm: Realm, scheduler: ImmediateSchedulerType) {
        self.scheduler = scheduler
        self.realm = realm
    }
    
    func findById(id: String) -> Observable<T> {
        let realm = self.realm
        guard let object = realm.object(ofType: T.self, forPrimaryKey: id)
            else {
                return Observable.error(RMError.ObjectNotFoundError)
        }
        return Observable.from(object: object)
    }
    
    func queryAll() -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            let objects = realm.objects(T.self)
            
            return Observable.array(from: objects)
            }
            .subscribeOn(scheduler)
    }
    
    func query(with predicate: NSPredicate,
               sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            let objects = realm.objects(T.self)
                .filter(predicate)
                .sorted(by: sortDescriptors.map(SortDescriptor.init))
            return Observable.array(from: objects)
            }
            .subscribeOn(scheduler)
    }
    
    func save(entity: T) -> Completable {
        return Completable.deferred {
            return self.realm.rx.save(entity: entity)
            }.subscribeOn(scheduler)
    }
    
    func save(entity: [T]) -> Completable {
        return Completable.deferred {
            return self.realm.rx.save(entity: entity)
            }.subscribeOn(scheduler)
    }
    
    func delete(entity: T, id: AnyObject) -> Completable {
        return Completable.deferred {
            return self.realm.rx.delete(entity: entity, id: id)
            }.subscribeOn(scheduler)
    }
    
    func deleteAll() -> Completable {
        return Completable.deferred {
            return self.realm.rx.deleteAll()
            }.subscribeOn(scheduler)
    }
}

enum RMError: Error{
    case ObjectNotFoundError
}
