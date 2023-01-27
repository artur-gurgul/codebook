
class Subject<T> {
    public observers = Array<Observer<T>>()
    
    attach(observer: Observer<T>): void {
        this.observers.push(observer)
    }

    notify(value: T) {
        for(let observer of this.observers) {
            observer.notify(value)
        }
    }
}

interface Observer<T> {
    notify(value: T): void
}

class LabelObserver implements Observer<string> {
    notify(value: string) {
        console.log(`your email is: ${value}`)
    }
}

class IconObserver implements Observer<string> {
    notify(value: string) {
        if (value.length > 12) {
            console.log(`correct`)
        } else {
            console.log(`incorrect`)
        }
    }
}

let subject = new Subject()

let observer1 = new LabelObserver()
subject.attach(observer1)

let observer2 = new IconObserver()
subject.attach(observer2)

subject.notify("exa")
subject.notify("example@do")
subject.notify("example@domain.com")