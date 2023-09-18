
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
        if(!found && this.parent){
            found = this.parent.findMethod(name)
        }
        if(!found){
            throw `Method ${name} not found`
        }
        return found
    }

    addMethod(srMethod){
        this.methods[srMethod.name]=srMethod
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

class SRBooleanInstance extends SRInstance{
    constructor(value){
        super(SR_KERNEL.classess.Boolean)
        this.variables["value"]=value
    }
}

class SRIntegerInstance extends SRInstance{
    constructor(value){
        super(SR_KERNEL.classess.Integer)
        this.variables.value=value
    }
}

class SRKernel{

    constructor(){
        this.classess={}
        this.defineClass("Object")
        this.defineClass("Class")
        this.defineClass("Integer")
        this.defineClass("Boolean")
    }

    defineClass(name,parent){
        if(!parent && name != "Object"){
            parent = this.classess.Object
        }
        this.classess[name]= new SRClass(name,parent)
    }
}


function initClasses(){
    let objectClass = SR_KERNEL.classess.Object
    let booleanClass = SR_KERNEL.classess.Boolean
    let integerClass = SR_KERNEL.classess.Integer
    booleanClass.trueInstance = new SRBooleanInstance(true)
    booleanClass.falseInstance = new SRBooleanInstance(false)

    objectClass.addMethod(new SRMethod("==",1,function(self,args){
        if(self == args[0]){
            return booleanClass.trueInstance
        }else{
            return booleanClass.falseInstance
        }
    }))

    integerClass.addMethod(new SRMethod("+",1,function(self,args){
        let result =  self.variables.value + args[0].variables.value
        return new SRIntegerInstance(result)
    }))

    integerClass.addMethod(new SRMethod("-",1,function(self,args){
        let result =  self.variables.value - args[0].variables.value
        return new SRIntegerInstance(result)
    }))


    integerClass.addMethod(new SRMethod("*",1,function(self,args){
        let result =  self.variables.value * args[0].variables.value
        return new SRIntegerInstance(result)
    }))


    integerClass.addMethod(new SRMethod("/",1,function(self,args){
        let result =  self.variables.value / args[0].variables.value
        return new SRIntegerInstance(result)
    }))

}

const SR_KERNEL = new SRKernel()
initClasses()