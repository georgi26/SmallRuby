
class SRModule{
    constructor(name){
        this.name = name
    }
}

class SRClass {
    constructor(name,parent){
        this.name = name
        this.parent = parent
        this.methods = []
        this.classVariables = []
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
        this.variables = []
    }

    send(name,args){
        
    }

}
const SRObject = {
    constructor(){
        this.metaClass = new SRClass("Class")
    }
}