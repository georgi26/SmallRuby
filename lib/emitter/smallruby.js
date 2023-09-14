
class SRModule{
    constructor(name){
        this.name = name
    }
}

class SRClass {
    constructor(name,parent){
        this.name = name
        this.parent = parent
        this.methods = {}
        this.classVariables = {}
    }

    createInstance(){
        return new SRInstance(this.name)
    }

    findMethod(name){
        let found = this.methods[name]
        if(!found){
            found = this.parent.findMethod(name)
        }
        return found
    }
}

class SRMethod{
    constructor(name,args,body){
        this.name = name
        this.args = args
        this.body = body 
    }
}

class SRInstance{
    constructor(srClass){
        this.srClass = srClass
        this.variables = {}
    }
    send(name,args){
        const srMethod = this.srClass.findMethod(name)
        return srMethod.body.apply(this,[this,args])
    }

}

class SRIntegerInstance extends SRInstance{
    constructor(value){
        super(SRKernel.classess["Integer"])
        this.variables["value"]=value
    }
}

function initSRKernel(){

    let objectClass = new SRClass("Object",null)
    let classClass = new SRClass("Class",objectClass)
    let integerClass = new SRClass("Integer",objectClass)
    integerClass.methods["+"]= new SRMethod("+",1,function(self,args){
        let result =  self.variables.value + args[0].variables.value
        return new SRIntegerInstance(result)
    })
    return {
        classess:{"Object":objectClass,"Class":classClass,"Integer":integerClass}
    }
}

const SRKernel = initSRKernel() 