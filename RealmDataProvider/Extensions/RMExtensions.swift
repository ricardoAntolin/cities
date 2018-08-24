
import Realm
import RealmSwift
import RxSwift

extension Object {
    static func build<O: Object>(_ builder: (O) -> () ) -> O {
        let object = O()
        builder(object)
        return object
    }
}

extension SortDescriptor {
    init(sortDescriptor: NSSortDescriptor) {
        self.init(keyPath: sortDescriptor.key ?? "", ascending: sortDescriptor.ascending)
    }
}

extension Reactive where Base: Realm {
    func save<R: Object>(entity: R, update: Bool = true) -> Completable  {
        return Completable.create { observer in
            do {
                try self.base.write {
                    self.base.add(entity, update: update)
                }
                observer(.completed)
            } catch {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func save<R: Object>(entity: [R], update: Bool = true) -> Completable  {
        return Completable.create { observer in
            do {
                try self.base.write {
                    self.base.add(entity, update: update)
                }
                observer(.completed)
            } catch {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func delete<R: Object>(entity: R, id: AnyObject) -> Completable {
        return Completable.create { observer in
            do {
                guard let object = self.base.object(ofType: R.self, forPrimaryKey: id) else { fatalError() }
                
                try self.base.write {
                    self.base.delete(object)
                }
                observer(.completed)
            } catch {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func deleteAll() -> Completable {
        return Completable.create { observer in
            do {
                try self.base.write {
                    self.base.deleteAll()
                }
                observer(.completed)
            } catch {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
}
