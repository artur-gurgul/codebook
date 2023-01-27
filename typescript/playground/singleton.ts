

class Singleton {
    private static instance = new Singleton()

    static getInstance(): Singleton {
        return this.instance
    }

    public v1 = "initial value"

    private constructor() {

    }
}


let o1 = Singleton.getInstance()
let o2 = Singleton.getInstance()

o1.v1 = "one change"
o2.v1 = "secund change"

console.log(o1)
console.log(o2)