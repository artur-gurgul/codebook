

class Equipment {
    public id: string

    constructor(id: string) {
        this.id = id
    }
}

class EquipmentManager {
    private pool = Array<Equipment>()

    getEquipment(): Equipment {
        return this.pool.pop() || new Equipment(`equipment id = ${Math.random()}`)
    }

    returnEquipment(equipment: Equipment) {
        this.pool.push(equipment)
    }

    inspect() {
        console.log(this.pool)
    }
}

let equipmentManager = new EquipmentManager()

let equipmentFor1Employee = equipmentManager.getEquipment()
console.log(equipmentFor1Employee)

let equipmentFor2Employee = equipmentManager.getEquipment()
console.log(equipmentFor2Employee)
equipmentManager.returnEquipment(equipmentFor2Employee)

let equipmentFor3Employee = equipmentManager.getEquipment()
console.log(equipmentFor3Employee)


equipmentManager.returnEquipment(equipmentFor1Employee)
//equipmentManager.returnEquipment(equipmentFor3Employee)


equipmentManager.inspect()