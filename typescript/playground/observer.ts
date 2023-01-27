
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

class HTMLInputElementSubject extends Subject<string> {
    constructor(id: string) {
        super()
        document.getElementById(id)?.addEventListener("keyup", e => {
            let input = e.target as HTMLInputElement
            this.notify(input.value)
        })
    }
}

let subject = new HTMLInputElementSubject("email")

class LabelObserver implements Observer<string> {
    notify(value: string) {
        let emailOutput = document.getElementById("output") as HTMLBodyElement
        emailOutput.innerHTML = `your email is: ${value}`
    }
}

class IconObserver implements Observer<string> {
    notify(value: string) {
        let emailIsCorrect = document.getElementById("is-correct") as HTMLBodyElement
        if (value.length > 12) {
            emailIsCorrect.innerHTML = `correct`
        } else {
            emailIsCorrect.innerHTML = `incorrect`
        }
    }
}

let labelObserver = new LabelObserver()
subject.attach(labelObserver)

let iconObserver = new IconObserver()
subject.attach(iconObserver)