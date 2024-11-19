from django.db import models

# Create your models here.
class login1(models.Model):
    login_id=models.AutoField(primary_key=True)
    username=models.CharField(max_length=225)
    password=models.CharField(max_length=225)
    usertype=models.CharField(max_length=225) 
 
class department(models.Model):
    department_id=models.AutoField(primary_key=True)
    dept_name=models.CharField(max_length=225)

class doctor(models.Model):
    doctor_id=models.AutoField(primary_key=True)
    login=models.ForeignKey(login1,on_delete=models.CASCADE)
    department=models.ForeignKey(department,on_delete=models.CASCADE)
    fname=models.CharField(max_length=225)
    lname=models.CharField(max_length=225)
    place=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    email=models.CharField(max_length=225)
    qualification=models.CharField(max_length=225)
    image=models.CharField(max_length=2000)

class pharmacy(models.Model):
    pharmacy_id=models.AutoField(primary_key=True)
    login=models.ForeignKey(login1,on_delete=models.CASCADE)
    pharmacy_name=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    email=models.CharField(max_length=225)

class lab(models.Model):
    lab_id=models.AutoField(primary_key=True)
    login=models.ForeignKey(login1,on_delete=models.CASCADE)
    lab_name=models.CharField(max_length=225)
    lab_phone=models.CharField(max_length=225)
    lab_email=models.CharField(max_length=225)


class user(models.Model):
    user_id=models.AutoField(primary_key=True)
    login=models.ForeignKey(login1,on_delete=models.CASCADE)
    user_fname=models.CharField(max_length=225)
    user_lname=models.CharField(max_length=225)
    place=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    email=models.CharField(max_length=225)

class patients(models.Model):
    patient_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    patient_fname=models.CharField(max_length=225)
    patient_lname=models.CharField(max_length=225)
    place=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    email=models.CharField(max_length=225)
    housename=models.CharField(max_length=225)
    gender=models.CharField(max_length=225)
    blood_group=models.CharField(max_length=225)
    dob =models.CharField(max_length=225)

class schedule(models.Model):
    schedule_id=models.AutoField(primary_key=True)
    doctor=models.ForeignKey(doctor,on_delete=models.CASCADE)
    start_time=models.CharField(max_length=225)
    end_time=models.CharField(max_length=225)
    schedule_date=models.CharField(max_length=225)
    fee_amount=models.CharField(max_length=225)

class bookings(models.Model):
    booking_id=models.AutoField(primary_key=True)
    schedule=models.ForeignKey(schedule,on_delete=models.CASCADE)
    patient=models.ForeignKey(patients,on_delete=models.CASCADE)
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    booking_date_time=models.CharField(max_length=225)
    Booking_status=models.CharField(max_length=225)

class physical_conditions(models.Model):
    physical_condition_id=models.AutoField(primary_key=True)
    patient=models.ForeignKey(patients,on_delete=models.CASCADE)
    blood_pressure=models.CharField(max_length=225)
    sugar=models.CharField(max_length=225)
    cholesterol=models.CharField(max_length=225)
    height=models.CharField(max_length=225)
    weight=models.CharField(max_length=225)
    report=models.CharField(max_length=225)
    description=models.CharField(max_length=225)
    date_time=models.CharField(max_length=225)

class medical_notes(models.Model):
    medical_note_id=models.AutoField(primary_key=True)
    booking=models.ForeignKey(bookings,on_delete=models.CASCADE)
    description=models.CharField(max_length=225)
    date_time=models.CharField(max_length=225)


class labtest(models.Model):
    labtest_id=models.AutoField(primary_key=True)
    booking=models.ForeignKey(bookings,on_delete=models.CASCADE)
    test_date=models.CharField(max_length=225) 
    test_name=models.CharField(max_length=225)
    test_description=models.CharField(max_length=225)
    test_amount=models.CharField(max_length=225)  
    test_status=models.CharField(max_length=225)
    lab=models.ForeignKey(lab,on_delete=models.CASCADE)
 

  
class medicines(models.Model):
    medicine_id=models.AutoField(primary_key=True)
    pharmacy=models.ForeignKey(pharmacy,on_delete=models.CASCADE)
    medicine_name=models.CharField(max_length=225)
    description=models.CharField(max_length=225)   
    available_qty=models.CharField(max_length=225)  
    expiry_date=models.CharField(max_length=225)  
    rate=models.CharField(max_length=225)  

class medicine_prescriptions(models.Model):
    med_pres_id=models.AutoField(primary_key=True)
    booking=models.ForeignKey(bookings,on_delete=models.CASCADE)
    medicine=models.ForeignKey(medicines,on_delete=models.CASCADE)
    date_time=models.CharField(max_length=225) 
    pres_description=models.CharField(max_length=225)
    p_amount=models.CharField(max_length=225)  
    pres_status=models.CharField(max_length=225) 


class payments(models.Model):
    pay_id=models.AutoField(primary_key=True)
    booking=models.ForeignKey(bookings,on_delete=models.CASCADE)
    amount=models.CharField(max_length=225)
    payment_date=models.CharField(max_length=225)   
    payment_type=models.CharField(max_length=225)   

class chats(models.Model):
    chat_id=models.AutoField(primary_key=True)
    sender=models.IntegerField(max_length=225) 
    sender_type=models.CharField(max_length=225)
    receiver=models.IntegerField(max_length=225)  
    reciver_type=models.CharField(max_length=225)   
    message=models.CharField(max_length=225) 
    date_time=models.CharField(max_length=225) 




class chat(models.Model):
    from_id = models.ForeignKey(login1,on_delete=models.CASCADE,related_name="from_id")
    to_id = models.ForeignKey(login1,on_delete=models.CASCADE,related_name="to_id")
    message = models.CharField(max_length=225)
    date_time = models.CharField(max_length=225)
class subscription(models.Model):
    sub_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    amount=models.CharField(max_length=225)
    from_date=models.CharField(max_length=225)   
    to_date=models.CharField(max_length=225)
    sub_status=models.CharField(max_length=225)   
   

