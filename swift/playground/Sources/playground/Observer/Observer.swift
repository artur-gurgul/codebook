
protocol Observer<ValueType> {
    associatedtype ValueType
    func update(value: ValueType)
}

struct Subject<T> {    
    private var observers: [(T) -> Void] = []
    
    mutating func attach<O: Observer>(observer: O) where O.ValueType == T {
        observers.append { observer.update(value: $0) }
    }

    func notyfi(value: T) {
        for observer in observers {
            observer(value)
        }
    }
}

class ConcreteObserver: Observer {
    func update(value: String) {
        print("received: \(value)")
    }
}

func runObserverExample() {
    var subject = Subject<String>()

    let observer1 = ConcreteObserver()
    subject.attach(observer: observer1)

    let observer2 = ConcreteObserver()
    subject.attach(observer: observer2)
    
    subject.notyfi(value: "some string")
}

// Version with more modern syntax
/*
protocol Observer<ValueType> {
    associatedtype ValueType
    func update(value: ValueType)
}

struct Subject<T> {
    private var observers = Array<any Observer<T>>()

    mutating func attach(observer: any Observer<T>) {
        observers.append(observer)
    }

    func notify(value: T) {
        for observer in observers {
            observer.update(value: value)
        }
    }
}
*/