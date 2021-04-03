protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happen?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}


struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second")
    }
}

class Doctor: AdvancedLifeSupport{
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second")

    }
    
    func useStethscope(){
        print("listening for hear sound")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alibe by the BeeGees")
    }
    
    func useElectricDrill() {
        print("whrrrr")
    }
}


let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
