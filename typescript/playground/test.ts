

function fib (n: number, mem: Map<number, number> = new Map<number, number>()): number {
    if (n == 1 || n == 2) {
        return 1
    }

    let v1 = mem.get(n-1)
    if (v1 == undefined) {
        v1 = fib(n-1, mem)
        mem.set(n-1, v1)
    }

    let v2 = mem.get(n-2)
    if (v2 == undefined) {
        v2 = fib(n-2, mem)
        mem.set(n-2, v2)
    }
    return v1 + v2 

}

console.log(fib(50))



