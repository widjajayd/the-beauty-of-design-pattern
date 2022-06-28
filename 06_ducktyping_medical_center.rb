
class Patient
  attr_reader   :name, :problem
  attr_accessor :has_recipe, :has_receipt

  def initialize(name:, problem:)
    @name = name
    @problem = problem
    @has_recipe  = false
    @has_receipt = false
  end
end

class Doctor
  attr_reader :name
  def initialize(name:)
    @name = name
  end

  def check(patient)
    puts "Doctor #{name} check #{patient.name}"
  end

  def treat(patient)
    puts "Doctor #{name} treat #{patient.name}"
  end

  def prescribe_recipe(patient)
    puts "Doctor #{name} prescribe recipe #{patient.name}"
    patient.has_recipe = true
  end

  def give_receipt(patient)
    puts "Doctor #{name} give receipt #{patient.name}"
    patient.has_receipt = true
  end
end

class EmergencyDoctor < Doctor
  def treatment_process(patient:)
    check patient
    prescribe_recipe patient
    give_receipt patient
  end
end

class Dentist < Doctor
  def treatment_process(patient:)
    check patient
    treat patient
    give_receipt patient
  end
end

class Acupuncturist < Doctor
  def treatment_process(patient:)
    check patient
    treat patient
    prescribe_recipe patient
    give_receipt patient
  end
end

class Pharmacy
  def initialize(name: )
    @name = name
  end

  def provide_service(patient: )
    provide_medicine patient
    process_payment patient
  end

  def provide_medicine(patient)
    if patient.has_recipe
      puts "pharmacy provide medicine patient #{patient.name}"
    end
  end

  def process_payment(patient)
    if patient.has_receipt
      puts "pharmacy process payment patient #{patient.name}"
    end
  end
end

class MedicalCenter
  attr_reader :name, :doctors, :pharmacy

  def initialize(name:, doctors:)
    @name = name
    @doctors = doctors
    @pharmacy = Pharmacy.new(name: "pharmacy Husada")
  end

  def register_patient(patient:)
    puts "patient #{patient.name} register to #{name}"
  end

  def process_patient(patient:)
    puts "start process for patient with name #{patient.name}"
    doctor = choose_doctor_from_problem(patient: patient)
    puts "patient #{patient.name} waiting queue"
    puts "patient #{patient.name} meet with #{doctor.name}"
    doctor.treatment_process(patient: patient)
    @pharmacy.provide_service(patient: patient)
    puts "process done for patient #{patient.name} "
  end

  def choose_doctor_from_problem(patient: )
    doctor = case patient.problem.downcase
             when 'flu', 'accident', 'dizzy'
               choose_doctor "EmergencyDoctor"
             when 'tooth'
               choose_doctor "Dentist"
             when 'acupuncture'
               choose_doctor "Acupuncturist"
             end
  end

  def choose_doctor(option)
    @doctors.each do |doctor|
      return doctor if doctor.class.to_s == option
    end
  end
end

# main program
# -----------------------------------

# init doctors
@jen = EmergencyDoctor.new(name: 'Jen')
@john = Dentist.new(name: 'john')
@ann = Acupuncturist.new(name: 'ann')
doctors = [@jen, @john, @ann]

# init MedicalCenter
@med_express = MedicalCenter.new(name: 'Med Express Clinic', doctors: doctors)

# first patient
@philip = Patient.new(name: 'philip', problem: 'Flu')
@med_express.register_patient(patient: @philip)
@med_express.process_patient(patient: @philip)
# second patient
@andrew = Patient.new(name: 'andrew', problem: 'Tooth')
@med_express.register_patient(patient: @andrew)
@med_express.process_patient(patient: @andrew)

# program output
# -----------------------------------
# Doctor Jen prescribe recipe philip
# Doctor Jen give receipt philip
# pharmacy provide medicine patient philip
# pharmacy process payment patient philip
# process done for patient philip 
# patient andrew register to Med Express Clinic
# start process for patient with name andrew
# patient andrew waiting queue
# patient andrew meet with john
# Doctor john check andrew
# Doctor john treat andrew
# Doctor john give receipt andrew
# pharmacy process payment patient andrew
# process done for patient andrew 
