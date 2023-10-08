
class SRModule{
    constructor(name){
        this.name = name
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

class SRClass extends SRInstance{
    constructor(name,parent){   
        super(null)     
        this.name = name
        this.parent = parent
        this.methods = {}
        this.classVariables = {}
    }

    createInstance(){
        return new SRInstance(this)
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
        this.defineClass("Class")
        this.defineClass("Object")
        this.defineClass("Integer")
        this.defineClass("Boolean")
        this.classess
    }

    defineClass(name,parent){
        if(!parent && name != "Object"){
            parent = this.classess.Object
        }
        this.classess[name]= new SRClass(name,parent)
        this.classess[name].srClass = this.classess.Class
    }
}


function initClasses(){
    let objectClass = SR_KERNEL.classess.Object
    let booleanClass = SR_KERNEL.classess.Boolean
    let integerClass = SR_KERNEL.classess.Integer
    let classClass  = SR_KERNEL.classess.Class
    booleanClass.trueInstance = new SRBooleanInstance(true)
    booleanClass.falseInstance = new SRBooleanInstance(false)

    booleanClass.addMethod(new SRMethod("ifTrue",0,function(self,args,block){
        if(self.variables.value){
           block.apply(self,[self,[]])
        }
    }))

    classClass.addMethod(new SRMethod("new",0,function(self){
        return self.createInstance()
    }))
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

    integerClass.addMethod(new SRMethod(">",1,function(self,args){
        let result =  self.variables.value > args[0].variables.value
        if(result){
            return booleanClass.trueInstance
        }else{
            return booleanClass.falseInstance
        }
    }))

        integerClass.addMethod(new SRMethod("<",1,function(self,args){
        let result =  self.variables.value < args[0].variables.value
        if(result){
            return booleanClass.trueInstance
        }else{
            return booleanClass.falseInstance
        }
    }))

}

const SR_KERNEL = new SRKernel()
initClasses()
